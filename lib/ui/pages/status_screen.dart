import 'package:bandnames_flutter_socket/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final socketService = context.watch<SocketService>();
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('status ${socketService.serverStatus}')],
      ),
      // body: Center(child: Text('ServerStatus: ${socketService.ServerStatus}')),
    );
  }
}
