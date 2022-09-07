import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainAppBar.dart';
import 'addView.dart';
import 'model.dart';
import 'taskList.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'TIG169 TODO',
        backgroundColor: Colors.grey,
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TaskList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () async {
            var newTask = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        addView(Task(name: 'message', checked: false))));
            Provider.of<MyState>(context, listen: false).addTask(newTask);
          },
          child: Icon(Icons.add, size: 52)),
    );
  }
}
