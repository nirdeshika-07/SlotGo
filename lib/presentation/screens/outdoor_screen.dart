import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/games_model.dart';
import '../../features/bloc/games_bloc.dart';
import '../widgets/game_card.dart';

class OutdoorScreen extends StatefulWidget {
  const OutdoorScreen({super.key});

  @override
  State<OutdoorScreen> createState() => _OutdoorScreenState();
}

class _OutdoorScreenState extends State<OutdoorScreen> {
  @override
  void initState(){
    super.initState();
    context.read<GamesBloc>().add(OutdoorGameFetched());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<GamesBloc, GameStates>(
            builder: (context,state){
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
              if(state is OutdoorGamesSuccess){
                final List<GamesModel> games = state.outdoorGames;
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

