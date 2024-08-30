import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget{
  final String taskname;
  final bool isCompleted;
  Function(bool?)? OnChanged;
  Function(BuildContext)? deleteFunction;
   ToDoList ({super.key,required this.taskname,required this.isCompleted,required this.OnChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.only(left:25.0,right:25,top:25),
        child:Slidable(
          
    endActionPane: ActionPane(
      
            motion: StretchMotion(), 
      children: [
      SlidableAction
      (
        borderRadius: BorderRadius.circular(8),
        onPressed: deleteFunction,
        icon: Icons.delete,
        backgroundColor: const Color.fromARGB(255, 255, 101, 90),
        ),]),
    child: Container(
  padding:EdgeInsets.all(24),
  child: Row(children: [
    Checkbox(value: isCompleted, onChanged: OnChanged,activeColor: const Color.fromARGB(255, 43, 101, 188),),
    Text(taskname,
    style: TextStyle(decoration: isCompleted ? TextDecoration.lineThrough:TextDecoration.none,fontSize:24),)
  ],),
  decoration: BoxDecoration(

    color:Colors.blue[200],
    borderRadius: BorderRadius.circular(8)
  ),
)
  )
    );

  }
}