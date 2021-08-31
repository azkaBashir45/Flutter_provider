import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TodoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

class Task {
  String? title;
  bool? isDone;
  Task({this.title, this.isDone});

}
class TaskData{
 
 List<Task> listData=[
   Task(title:'Book', isDone:false)
 ];

}