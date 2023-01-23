import 'package:flutter/Material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  connecting,
  offline,
  online,
}

class SocketService with ChangeNotifier {
  late ServerStatus _serverStatus = ServerStatus.connecting;

  late Socket _socket;

  Function get emit => _socket.emit;
  ServerStatus get serverStatus => _serverStatus;
  Socket get socket => _socket;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    _socket = io(
        'http://localhost:3001',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    _socket.onconnect((_) {
      // print('Got connected');
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }
}
