import 'package:flutter/material.dart';
import 'package:ssssssss/XOboard.dart';

class Splash extends StatelessWidget {
  static String RouteName = "Splash";
  String player1="";
  String player2="";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("X o Game"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: TextField(
              onChanged:(text) {
                player1=text;
              } ,
              decoration: InputDecoration(hintText: 'enter palyer1 name',
                border:OutlineInputBorder(borderRadius:BorderRadius.circular(30))

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextField(
              onChanged:(text) {
                player2=text;
              } ,
              decoration: InputDecoration(hintText: 'enter palyer2 name',
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(30))
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(24),
            child: ElevatedButton(
                onPressed: () {
              Navigator.pushNamed(context, XoBoard.RoutName,arguments: GameBoardArguments(player1, player2));
            }, child: Text("Enter")),

          )
        ],
      ),
    );
  }
}
class GameBoardArguments{
  String player1;
  String player2;
GameBoardArguments(this.player1, this.player2);

}