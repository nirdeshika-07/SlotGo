import 'package:flutter/material.dart';
import 'package:game_booking_system/provider/games_api_provider.dart';
import 'package:game_booking_system/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> GamesApiProvider()),
          ChangeNotifierProvider(create: (_)=> ServicesProvider()),
        ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlotGo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
