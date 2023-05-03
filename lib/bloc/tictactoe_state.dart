part of 'tictactoe_bloc.dart';

abstract class TictactoeState extends Equatable {
  final List<String> squares;
  const TictactoeState({required this.squares});

  @override
  List<Object> get props => [];
}

class TictactoePlayState extends TictactoeState {
  final String nextValue;

  const TictactoePlayState({required super.squares, required this.nextValue});

  @override
  List<Object> get props => [squares, nextValue];
}

class TictactoeGameOverState extends TictactoeState {
  final String winner;

  const TictactoeGameOverState({required super.squares, required this.winner});

  @override
  List<Object> get props => [squares, winner];
}
