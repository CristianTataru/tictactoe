part of 'tictactoe_bloc.dart';

abstract class TictactoeEvent extends Equatable {
  const TictactoeEvent();

  @override
  List<Object> get props => [];
}

class TictactoeOnSquarePressed extends TictactoeEvent {
  final int index;

  const TictactoeOnSquarePressed({required this.index});

  @override
  List<Object> get props => [index];
}

class TictactoeOnRestartPressed extends TictactoeEvent {}
