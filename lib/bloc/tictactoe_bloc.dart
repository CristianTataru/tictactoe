import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tictactoe_event.dart';
part 'tictactoe_state.dart';

class TictactoeBloc extends Bloc<TictactoeEvent, TictactoeState> {
  TictactoeBloc() : super(const TictactoePlayState(squares: ['', '', '', '', '', '', '', '', ''], nextValue: "X")) {
    on<TictactoeOnSquarePressed>(_onTictactoeEventOnSquarePressed);
    on<TictactoeOnRestartPressed>(_onTictactoeEventOnRestartPressed);
  }

  bool checkSquaresAreEqual(List<String> squares, int a, int b, int c) =>
      squares[a] == squares[b] && squares[b] == squares[c] && squares[a] != "";

  bool gameOver(List<String> squares) =>
      checkSquaresAreEqual(squares, 0, 1, 2) ||
      checkSquaresAreEqual(squares, 3, 4, 5) ||
      checkSquaresAreEqual(squares, 6, 7, 8) ||
      checkSquaresAreEqual(squares, 0, 3, 6) ||
      checkSquaresAreEqual(squares, 1, 4, 7) ||
      checkSquaresAreEqual(squares, 2, 5, 8) ||
      checkSquaresAreEqual(squares, 0, 4, 8) ||
      checkSquaresAreEqual(squares, 2, 4, 6);

  FutureOr<void> _onTictactoeEventOnSquarePressed(TictactoeOnSquarePressed event, Emitter<TictactoeState> emit) {
    final previousState = state as TictactoePlayState;
    List<String> squares = List.from(previousState.squares);
    squares[event.index] = previousState.nextValue;
    String nextValue;
    if (previousState.nextValue == "X") {
      nextValue = '0';
    } else {
      nextValue = 'X';
    }
    if (gameOver(squares)) {
      emit(TictactoeGameOverState(squares: squares, winner: previousState.nextValue));
    } else {
      emit(TictactoePlayState(squares: squares, nextValue: nextValue));
    }
  }

  FutureOr<void> _onTictactoeEventOnRestartPressed(TictactoeOnRestartPressed event, Emitter<TictactoeState> emit) {
    emit(const TictactoePlayState(squares: ['', '', '', '', '', '', '', '', ''], nextValue: 'X'));
  }
}
