part of 'games_bloc.dart';

@immutable
sealed class GameStates{}

final class GamesInitial extends GameStates{}
final class IndoorGamesSuccess extends GameStates{
  final List<GamesModel> indoorGames;

  IndoorGamesSuccess({
    required this.indoorGames
  });
}

final class OutdoorGamesSuccess extends GameStates{
  final List<GamesModel> outdoorGames;

  OutdoorGamesSuccess({
    required this.outdoorGames
  });
}
final class GamesFailure extends GameStates{
  final String error;
  GamesFailure(this.error);
}
final class GamesLoading extends GameStates{}