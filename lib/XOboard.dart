import 'package:flutter/material.dart';
import 'package:ssssssss/SplashScreen.dart';
import 'XoButton.dart';

class XoBoard extends StatefulWidget {
  static String RoutName="gameboard";
  @override
  State<XoBoard> createState() => _XoBoardState();
}

class _XoBoardState extends State<XoBoard> {
  int score1 = 0;
  int score2 = 0;
  List<String> Board = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    GameBoardArguments args=ModalRoute.of(context)!.settings.arguments as GameBoardArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('X O board'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${args.player1}: $score1',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${args.player2}:$score2',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XoButton(
                    text: Board[0],
                    onpressed: onButtonClicked,
                    index: 0,
                  ),
                  XoButton(
                    text: Board[1],
                    onpressed: onButtonClicked,
                    index: 1,
                  ),
                  XoButton(
                    text: Board[2],
                    onpressed: onButtonClicked,
                    index: 2,
                  ),
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XoButton(
                      text: Board[3], onpressed: onButtonClicked, index: 3),
                  XoButton(
                      text: Board[4], onpressed: onButtonClicked, index: 4),
                  XoButton(
                      text: Board[5], onpressed: onButtonClicked, index: 5),
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XoButton(
                      text: Board[6], onpressed: onButtonClicked, index: 6),
                  XoButton(
                      text: Board[7], onpressed: onButtonClicked, index: 7),
                  XoButton(
                      text: Board[8], onpressed: onButtonClicked, index: 8),
                ],
              )),
        ],
      ),
    );
  }

  int counter = 0;

  onButtonClicked(int index) {
    if (Board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "O" : "X";
    Board[index] = symbol;
    print(Board);
    counter++;
    setState(() {});
    if (checkWinner(symbol)) {
      if (symbol == "X") {
        score2++;
      } else {
        score1++;
      }
      resetBoard();
    }
    if (counter == 9) {
      resetBoard();
    }
  }

  void resetBoard() {
    Board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i =i+3) {
      if (Board[i] == symbol &&
          Board[i + 1] == symbol &&
          Board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (Board[i] == symbol &&
          Board[i + 3] == symbol &&
          Board[i + 6] == symbol) {
        return true;
      }
    }
    if (Board[0] == symbol && Board[4] == symbol && Board[8] == symbol) {
      return true;
    }
    if (Board[2] == symbol && Board[4] == symbol && Board[6] == symbol) {
      return true;
    }
    return false;
  }
}
