import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Simple Login Demo',
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TodoState();
  }
}

class TodoState extends State<TodoList> {
  List<String> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
    );
  }

  Widget _buildTodoList() {
    _todoItems.add("123");
    _todoItems.add("456");
    return new ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
        return null;
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return new ListTile(title: new Text(todoText));
  }
}
