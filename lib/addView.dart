// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'mainAppBar.dart';
import 'model.dart';

class addView extends StatefulWidget {
  final Task task;
  addView(this.task);

  @override
  State<StatefulWidget> createState() => _addViewState();
}

class _addViewState extends State<addView> {
  TextEditingController taskNameInput = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
            title: 'New Item', backgroundColor: Colors.blue, actionBar: []),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          _taskInputField(),
          Container(height: 36),
          _addTaskButton(context)
        ]));
  }

  Widget _taskInputField() {
    return Center(
        child: Container(
      margin: EdgeInsets.only(top: 25),
      width: 330,
      height: 46,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextField(
          controller: taskNameInput,
          decoration: InputDecoration(
              hintText: 'What are you going to do?',
              contentPadding: EdgeInsets.only(left: 15))),
    ));
  }

  Widget _addTaskButton(context) {
    return FlatButton(
        onPressed: () {
          Navigator.pop(
              context, Task(title: taskNameInput.text.toString(), done: false));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 18),
            Text('ADD', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ));
  }
}
