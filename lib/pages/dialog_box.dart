import 'package:flutter/material.dart';
import 'package:todo/pages/button1.dart';


class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content: Container(
        height:120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(controller:controller, decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Add a task!"),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              MyButton(text: "Save", onPressed: onSave),
              //cancel button
              MyButton(text: "Cancel", onPressed: onCancel),

              const SizedBox(width: 8.0,)
            ],
          )
        ],)),


    );
  }
}