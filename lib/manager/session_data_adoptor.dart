import 'package:demo/manager/session_data.dart';
import 'package:hive/hive.dart';

class SessionDataAdapter extends TypeAdapter<SessionData> {
  @override
  final int typeId = 0;




  @override
  SessionData read(BinaryReader reader) {
    return SessionData.fromJson(reader.readMap());
  }

  @override
  void write(BinaryWriter writer, SessionData obj) {
    writer.writeMap(obj.toJson());
  }
}
