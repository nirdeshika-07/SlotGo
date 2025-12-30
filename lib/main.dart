import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_booking_system/bloc/games_bloc.dart';
import 'package:game_booking_system/provider/games_data_provider.dart';

import 'package:game_booking_system/screens/home_screen.dart';
import 'package:game_booking_system/screens/login_screen.dart';
import 'package:game_booking_system/services/games_services.dart';

void main() {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GamesApiServices(
          gamesApiProvider: GamesApiProvider()
      ),
      child: BlocProvider(
        create: (context) => GamesBloc(context.read<GamesApiServices>()),
        child: MaterialApp(
          title: 'SlotGo',
          theme: ThemeData.light().copyWith(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // scaffoldBackgroundColor: Pallete.backgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
