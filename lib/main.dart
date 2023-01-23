import 'package:bandnames_flutter_socket/services/socket_service.dart';
import 'package:bandnames_flutter_socket/ui/pages/home_screen.dart';
import 'package:bandnames_flutter_socket/ui/pages/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
 

 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SocketService(),)

      ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'status',
        routes: {
          'home':(context) => const HomeScreen(),
          'status':(context) => const StatusScreen()
        },
         
       ),
     );
   }
 }