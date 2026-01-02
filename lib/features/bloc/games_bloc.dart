import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/games_model.dart';
import '../../domain/services/games_services.dart';


part 'games_state.dart';
part 'games_event.dart';

class GamesBloc extends Bloc<GameEvents, GameStates>{
  final GamesApiServices gamesApiServices;
  GamesBloc(this.gamesApiServices) : super (GamesInitial()){
    on<IndoorGameFetched> (_getIndoorGames);
    on<OutdoorGameFetched> (_getOutdoorGames);
  }
  void _getIndoorGames(IndoorGameFetched event, Emitter<GameStates> state) async {
    emit(GamesLoading());
    try{
      final indoorGames = await gamesApiServices.fetchIndoorGames();

      emit(IndoorGamesSuccess(indoorGames: indoorGames));
    } catch (e){
      emit(GamesFailure(e.toString()));
    }
  }

  void _getOutdoorGames (OutdoorGameFetched event, Emitter<GameStates> state) async {
    emit(GamesLoading());
    try{
      final outdoorGames = await gamesApiServices.fetchOutdoorGames();

      emit(OutdoorGamesSuccess(outdoorGames: outdoorGames));
    }catch (e){
      emit(GamesFailure(e.toString()));
    }
  }
}