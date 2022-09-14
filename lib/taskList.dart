import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TaskList extends StatelessWidget {
  final List<Task> list;

  TaskList(this.list);

  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => _listItem(context, list[index]),
        padding: EdgeInsets.only(top: 15),
        scrollDirection: Axis.vertical,
        itemCount: list.length);
  }
}

Widget _listItem(context, task) {
  return (Container(
      padding: EdgeInsets.all(6.5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(90, 158, 158, 158)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
              checkColor: Colors.black,
              activeColor: Colors.transparent,
              value: task.checked,
              onChanged: ((value) {
                var state = Provider.of<MyState>(context, listen: false);
                if (!task.checked) {
                  state.checkTask(task);
                } else {
                  state.uncheckTask(task);
                }
              })),
          Text(task.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration:
                      task.checked ? TextDecoration.lineThrough : null)),
          Spacer(),
          Container(
              // padding: EdgeInsets.only(right: 8),
              child: FlatButton(
                  onPressed: () {
                    var state = Provider.of<MyState>(context, listen: false);
                    state.deleteTask(task);
                  },
                  child: Icon(Icons.close)))
        ],
      )));
}
