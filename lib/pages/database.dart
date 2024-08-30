import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList=[];

final _myBox=Hive.box('myBox');

void InitialData(){
  toDoList=[
    "I am checked!",true,
    "Slide me!",false
  ];
}

void LoadData(){
toDoList=_myBox.get("TODOLIST");
}

void updateDatabase(){
_myBox.put("TODOLIST",toDoList);
}
}