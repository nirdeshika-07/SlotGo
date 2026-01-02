import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/games_model.dart';
import '../../features/bloc/games_bloc.dart';
import '../widgets/game_card.dart';

class IndoorScreen extends StatefulWidget {
  const IndoorScreen({super.key});

  @override
  State<IndoorScreen> createState() => _IndoorScreenState();
}

class _IndoorScreenState extends State<IndoorScreen> {

  @override
  void initState(){
    super.initState();
    context.read<GamesBloc>().add(IndoorGameFetched());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GamesBloc, GameStates>(
          builder: (context, state) {
            if(state is GamesFailure){
              return Center(
                    child: Text('Error Loading Indoor Games: ${state.error}'),
                  );
            }

            if(state is GamesLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
            // if (games.isEmpty) {
            //   return const Center(child: Text('No indoor games found.'));
            // }
            if(state is IndoorGamesSuccess){
              final List<GamesModel> games=state.indoorGames;
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
            return ListView(
              children: [
                SizedBox(height: 300,),
                Center( child: CircularProgressIndicator(),)
              ],
            );
          }
      )
    );
  }
}

