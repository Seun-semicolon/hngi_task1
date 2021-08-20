import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTask extends StatefulWidget {
final Function addTask;

NewTask(this.addTask);
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  void submitData(){
    if(priceController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if(enteredTitle.isEmpty || enteredPrice<=0){
      return;
    }
    widget.addTask(
      enteredTitle,
      enteredPrice,
    );
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 5,
    child: Container(
  padding: EdgeInsets.all(6),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    TextField(
  decoration: InputDecoration(labelText: 'Title'),
  controller: titleController,
  onSubmitted: (_)=>submitData,
  ),
  TextField(
  decoration: InputDecoration(labelText: 'price'),
    controller: priceController,
    keyboardType: TextInputType.number,
    onSubmitted: (_)=> submitData,
  ),
    RaisedButton(child: Text('Add Task'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: submitData,
    ),
  ],
  ),
  )
    );
  }
}
