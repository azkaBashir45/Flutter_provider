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
  TaskData obj = TaskData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
          itemCount: obj.listData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${obj.listData[index].title}',
              ),
              trailing: Checkbox(
                value: obj.listData[index].isDone,
                onChanged: (value) {
                  setState(() {
                    obj.listData[index].isDone = value;
                  });
                },
              ),
            );
          }),
    );
  }
}

class Task {
  String? title;
  bool? isDone;
  Task({this.title, this.isDone});
}

class TaskData {
  List<Task> listData = [
    Task(title: 'Book', isDone: false),
    
  ];
}
