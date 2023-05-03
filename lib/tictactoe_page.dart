import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/bloc/tictactoe_bloc.dart';
import 'package:tic_tac_toe/theme/custom_colors.dart';

final bloc = TictactoeBloc();

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TictactoeBloc, TictactoeState>(
      bloc: bloc,
      builder: (context, tictactoeState) {
        return Scaffold(
          backgroundColor: CustomColors.background,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "TicTacToe",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TicTacToeButton(0),
                    TicTacToeButton(1),
                    TicTacToeButton(2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TicTacToeButton(3),
                    TicTacToeButton(4),
                    TicTacToeButton(5),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TicTacToeButton(6),
                    TicTacToeButton(7),
                    TicTacToeButton(8),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50), backgroundColor: CustomColors.squareColor),
                  onPressed: () {
                    bloc.add(TictactoeOnRestartPressed());
                  },
                  child: const Text(
                    "Restart",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                if (tictactoeState is TictactoeGameOverState) ...[
                  const SizedBox(height: 24),
                  const Text(
                    'Game Over!',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Winner: ${tictactoeState.winner}',
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}

class TicTacToeButton extends StatelessWidget {
  final int index;

  const TicTacToeButton(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TictactoeBloc, TictactoeState>(
      bloc: bloc,
      builder: (context, tictactoeState) {
        String buttonText = tictactoeState.squares[index];
        return GestureDetector(
          onTap: buttonText != ''
              ? null
              : () {
                  bloc.add(TictactoeOnSquarePressed(index: index));
                },
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black), color: CustomColors.squareColor),
            height: 90,
            width: 90,
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 100, color: buttonText == "X" ? CustomColors.xColor : CustomColors.zeroColor),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
