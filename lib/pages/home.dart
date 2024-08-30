import 'package:flutter/material.dart';
import 'ToDoList.dart';
import 'dialog_box.dart';
import 'database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget{
  const HomePage ({super.key});
@override
State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  ToDoDatabase db=ToDoDatabase();
final _myBox=Hive.box('myBox');
final _controller =TextEditingController();

@override
void initState(){
if(_myBox.get("TODOLIST")==null){
  db.InitialData();
}
else{
  db.LoadData();
}



  super.initState();

}
  void saveNewTask() {
  if (_controller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue[300],
        content: Text('Task cannot be empty',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
      ),
    );
  } else {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();

  }
}


  void CreateATask(){
showDialog(context: context, builder: (context){
  return DialogBox(
    controller: _controller,
    onSave: saveNewTask,
    onCancel: ()=>Navigator.of(context).pop(),
  );
},);
}

void deleteTask(int index) {
setState(() {
  db.toDoList.removeAt(index);
});
db.updateDatabase();

}

  void CheckBoxChanged(bool? value,int index){
    setState((){
db.toDoList[index][1]=!db.toDoList[index][1];
    });
db.updateDatabase();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
  actions: [
    Padding(padding: const EdgeInsets.only(right:25),
    child: Icon(Icons.favorite,color: const Color.fromARGB(255, 12, 46, 126),)
    
    )
  ],
                
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Let's DO it!",style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: CreateATask,
      child: Icon(Icons.add),


      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoList(taskname: db.toDoList[index][0],isCompleted: db.toDoList[index][1],OnChanged: (value)=>CheckBoxChanged(value,index),deleteFunction: (context)=> deleteTask(index));
        },
      ),
    );
  }

  
}

