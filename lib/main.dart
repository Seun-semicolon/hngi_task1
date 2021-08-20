import'package:flutter/material.dart';
import 'package:hngi_task1/task_list.dart';
import './task.dart';
import './new_task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNGi TAsk',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _userTasks = [
    Task(
      id: 't1',
      title: 'Calling http request',
      number: 1,
      date: DateTime.now(),
    ),
    Task(
      id: 't2',
      title: 'flutter and dart',
      number: 2,
      date: DateTime.now(),
    ),
  ];

  void _addNewTask(String taskTitle, double taskNumber){
    final newTask = Task(
    title: taskTitle,
      number: taskNumber,
       date: DateTime.now(),
       id: DateTime.now().toString(),
    );
    setState(() {
     _userTasks.add(newTask);
    });
  }

  void _showAddNewTask(BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
      return GestureDetector(
        onTap: () {},
        child: NewTask(_addNewTask),
        behavior: HitTestBehavior.opaque,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HNGi Task'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.add),
            onPressed: ()=> _showAddNewTask(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Container(
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: 300,
          //     height: 500,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //       image: DecorationImage(
          //         image: NetworkImage(
          //            'https://images.app.goo.gl/9QUNyAHe8dR9HVQp7'
          //         ),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          Text('Welcome Ilesanmi Oluwaseun',
            style: TextStyle(color: Colors.purpleAccent,
              fontSize: 21, fontWeight: FontWeight.bold,
            ),
          ),
          TaskList(_userTasks),
        ],
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
        onPressed: () => _showAddNewTask(context),
      ),
    );
  }
}
