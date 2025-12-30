part of 'games_bloc.dart';

@immutable
sealed class GameEvents{}

final class IndoorGameFetched extends GameEvents{}
final class OutdoorGameFetched extends GameEvents{}