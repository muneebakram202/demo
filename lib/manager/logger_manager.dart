import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends InterceptorsWrapper {




  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("\n\n🔴🔴🔴🔴 ------- Error Response Start ------- 🔴🔴🔴🔴\n");
    log("ERROR    ➡️➡️➡️➡️ ${err.message}\n");
    log("URL      ➡️➡️➡️➡️: ${err.response?.realUri}\n");
    log("Code     ➡️➡️➡️➡️ ${err.response?.statusCode}\n");
    if (err.response?.data != null) {
      log("Response ➡️➡️➡️➡️ ${err.response?.data}\n");
    }
    log("🔴🔴🔴🔴 --------- Error Response End ------- 🔴🔴🔴🔴\n\n");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("\n\n🟡🟡🟡🟡 ------- Request Start ------- 🟡🟡🟡🟡\n");

    log("Method   ➡️➡️➡️➡️: ${options.method}\n");
    log("URL      ➡️➡️➡️➡️: ${options.uri}\n");
    log("Headers  ➡️➡️➡️➡️: ${options.headers}\n");
    if (options.data != null) {
      log("Body     ➡️➡️➡️➡️: ${options.data}\n");
    }

    log("🟡🟡🟡🟡 ------- Request End ------- 🟡🟡🟡🟡\n\n");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) {
    log("\n\n🟢🟢🟢 ------- Success Response Start ------- 🟢🟢🟢\n");
    log("URL       ➡️➡️➡️➡️ ${response.realUri}\n");
    log("Code      ➡️➡️➡️➡️ ${response.statusCode}\n");
    if (response.data != null) {
      log("Response  ➡️➡️➡️➡️ ${response.data}\n");
    }
    log("🟢🟢🟢🟢 ------- Success Response End ------- 🟢🟢🟢🟢\n\n");
    super.onResponse(response, handler);
  }
}
