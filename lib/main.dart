import 'package:flutter/material.dart';

import 'list/ListItem.dart';

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
  List<ListItem> _allItems = List<ListItem>.generate(
      2, (i) => i == 0 ? EditTextItem() : TodoItem("123"));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
    );
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _allItems.length,
      itemBuilder: (context, index) {
        final item = _allItems[index];
        if (item is EditTextItem) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Enter a new todo item'),
              ));
        } else if (item is TodoItem) {
          return _buildTodoItem(item.text);
        }
        return null;
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return new ListTile(title: new Text(todoText));
  }
}
