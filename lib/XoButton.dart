import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  Function onpressed;
  String text;
  int index;
  XoButton({required this.text,required this .onpressed,required this.index});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(8),
            child:
            ElevatedButton(onPressed: () {
              onpressed(index);
            }, child: Text("$text",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),))));
  }
}
