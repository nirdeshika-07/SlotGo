import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_booking_system/presentation/screens/login_screen.dart';

import 'core/theme/slot_theme.dart';
import 'data/provider/games_data_provider.dart';
import 'domain/services/games_services.dart';
import 'features/bloc/games_bloc.dart';


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
          theme: SlotTheme.darkThemeMode,
          // ThemeData.light().copyWith(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
