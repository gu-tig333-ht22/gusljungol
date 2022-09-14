import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169 TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListPage(title: 'TIG169 TODO'),
    );
  }
}

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
      body: _listView(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addView()));
          },
          child: Icon(Icons.add, size: 52)),
    );
  }
}

Widget _listView() {
  var listItems = [
    'Watch TV',
    'Write a book',
    'Do homework',
    'Tidy Room',
    'Nap',
    'Shop Groceries',
    'Have fun',
    'Meditate'
  ];

  return ListView.builder(
      itemBuilder: (context, index) => _listItem(listItems[index]),
      padding: EdgeInsets.only(top: 15),
      scrollDirection: Axis.vertical,
      itemCount: listItems.length);
}

Widget _listItem(taskName) {
  return (Container(
      padding: EdgeInsets.all(6.5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(90, 158, 158, 158)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(value: false, onChanged: ((value) {})),
          Text(taskName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Spacer(),
          Container(
              padding: EdgeInsets.only(right: 7), child: Icon(Icons.close))
        ],
      )));
}

class addView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: 'New Item',
          backgroundColor: Colors.blue,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          _taskInputField(),
          Container(height: 36),
          _addTaskButton()
        ]));
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  const MainAppBar({
    Key? key,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.black, size: 28),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
        decoration: InputDecoration(
            hintText: 'What are you going to do?',
            contentPadding: EdgeInsets.only(left: 15))),
  ));
}

Widget _addTaskButton() {
  return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 18),
          Text('ADD', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ));
}
