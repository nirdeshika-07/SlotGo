import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/reusable_widget.dart';
import '../models/games.dart';
import '../provider/games_api_provider.dart';

class IndoorScreen extends StatefulWidget {
  const IndoorScreen({super.key});

  @override
  State<IndoorScreen> createState() => _IndoorScreenState();
}

class _IndoorScreenState extends State<IndoorScreen> {

  @override
  Widget build(BuildContext context) {
    final services= Provider.of<GamesApiProvider>(context,listen: false);
    final gamesServices= services.gamesServices;
    return GestureDetector(
      child: Scaffold(
        body: FutureBuilder<List<Games>>(
            future: gamesServices.fetchIndoorGames(),
            builder: (context,snapshot){
              if(snapshot.connectionState== ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.hasError){
                return const Center(
                  child: Text('Error Loading Indoor Games'),
                );
              }
              final games=snapshot.data ?? [];
              if (games.isEmpty) {
                return const Center(child: Text('No indoor games found.'));
              }
              return GridView.builder(
                  itemCount: games.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context,index){
                    final game=games[index];
                    return GameCard(game:game);
                  }
              );
            }
        ),
      ),
    );
  }
}

