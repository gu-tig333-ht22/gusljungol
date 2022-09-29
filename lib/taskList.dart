import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TaskList extends StatelessWidget {
  final List<Task> list;

  String filter;

  TaskList(this.list, this.filter);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var state = Provider.of<MyState>(context, listen: false);
        if (state.filter == 'Uncompleted' && list[index].done == false) {
          return _listItem(context, list[index]);
        } else if (state.filter == 'Completed' && list[index].done == true) {
          return _listItem(context, list[index]);
        } else if (state.filter == "Show All") {
          return _listItem(context, list[index]);
        } else {
          return SizedBox.shrink();
        }
      },
      padding: EdgeInsets.only(top: 15),
      scrollDirection: Axis.vertical,
    );
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
              value: task.done,
              onChanged: ((value) {
                var state = Provider.of<MyState>(context, listen: false);
                if (!task.done) {
                  state.checkTask(task);
                } else {
                  state.uncheckTask(task);
                }
              })),
          Text(task.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration: task.done ? TextDecoration.lineThrough : null)),
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
