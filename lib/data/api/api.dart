import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'api_const.dart';
import '../../manager/logger_manager.dart';

typedef ResponseCompletion = void Function(dynamic responseBody, bool success);

class Api{
  static bool apiCallInProgress = false;

  static Map<String, dynamic> commonHeaders() {
    Map<String, dynamic> requestHeaders = {
      'Content-type': 'application/json',
    };
    return requestHeaders;
  }


  Future<bool> checkConnectivity(responseCompletion) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      Map<String, dynamic> error = {
        "responseCode": 0,
        "responseMsg": "Check your internet connection and try again",
        "data": null
      };

      responseCompletion(error, false);
      return true;
    } else {
      return false;
    }
  }

  void callGetApi({
    required String url,
    required Map<String, dynamic> headers,
    Map<String, dynamic>? queryParam,
    required ResponseCompletion responseCompletion,
  }) async {
    if (await checkConnectivity(responseCompletion)) {
      return;
    }

    try {
      final dio = Dio(BaseOptions(
        headers: headers,
        queryParameters: queryParam,
        receiveTimeout: const Duration(seconds: ApiConst.receiveTimeout),
        connectTimeout: const Duration(seconds: ApiConst.connectTimeout),
        sendTimeout: const Duration(seconds: ApiConst.sendTimeout),
      ));

      dio.interceptors.add(LoggerInterceptor());

      var response = await dio
          .get(
        url,
      )
          .timeout(const Duration(milliseconds: ApiConst.connectTimeout));

      if (response.statusCode != null) {
        responseCompletion(response.data, true);
      } else {
        responseCompletion(response.data, false);
      }
    } on DioException catch (e) {
      apiCallInProgress = false;
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        handleException(
          'Connection Timeout',
          e.response?.statusCode ?? 408,
          responseCompletion,
        );
      } else {
        handleException(
          e.response?.statusMessage,
          e.response?.statusCode ?? 408,
          responseCompletion,
        );
      }
    }
  }

  static void handleException(
      String? message,
      int statusCode,
      responseCompletion,
      ) {
    String? msg = message != null
        ? message.isEmpty
        ? "Something went Wrong"
        : message.toString()
        : "Something went Wrong";

    Map<String, dynamic> error = {
      "responseCode": statusCode,
      "responseMsg": msg,
      "data": null
    };

    responseCompletion(error, false);
  }

}