// ignore_for_file: file_names
import 'globalFunctions.dart';

class Connection {
  bool isConnected = false;
  validateConnection() async {
    await globalFunctions.isConnected().then((bool value) async {
      isConnected = value;
    });
  }
}

final connection = Connection();