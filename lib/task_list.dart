import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './task.dart';

class TaskList extends StatelessWidget {

  final List<Task> tasks;

  TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 400,
      child: ListView.builder(itemBuilder: (ctx, index){
        return Card(
          elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
      child: ListTile(
      leading: CircleAvatar(
        radius: 30,
    child: Padding(
    padding: EdgeInsets.all(6),
    child: FittedBox(
    child: Text('\$${tasks[index].number}'),
    ),
    ),
    ),
    title: Text(tasks[index].title,
    style: Theme.of(context).textTheme.title ,
    ),
    subtitle: Text(DateFormat.yMMMd().format(tasks[index].date)
    ),

    ),
        );
    },
        itemCount: tasks.length,
      ),
    );
  }
}
