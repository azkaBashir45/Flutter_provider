import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //y provider ka packge h jaha hm change kry gy waha automatically hojy gy---kis data ko create krna h to hm waha create krdy gy
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: TodoApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
          itemCount: context.watch<TaskData>().listData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${context.watch<TaskData>().listData[index].title}',
              ),
              trailing: Checkbox(
                value: context.watch<TaskData>().listData[index].isDone,
                onChanged: (value) {
                  context.read<TaskData>().toogle(index, value);
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

//jb wrap krna to jisko kry gy to usko extend krna pry gy changeNotifier
class TaskData extends ChangeNotifier {
  List<Task> listData = [
    Task(title: 'Book', isDone: false),
  ];
  toogle(int index, bool? value) {
    listData[index].isDone = value;
    //hr koi use krly isko usky ly hm kry gy
    notifyListeners();
  }
}
