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
      1, (i) => i == 0 ? EditTextItem() : TodoItem("123"));

  List<TodoItem> _todoItems = List<TodoItem>();

  void _addTodoItem(String text) {
    setState(() {
      _todoItems.add(TodoItem(text));
      _allItems.clear();
      _allItems.add(EditTextItem());
      _allItems.addAll(_todoItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
    );
  }

  var txtController = TextEditingController(text: "");

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _allItems.length,
      itemBuilder: (context, index) {
        final item = _allItems[index];
        if (item is EditTextItem) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtController,
                onSubmitted: (value) {
                  _addTodoItem(value);
                  txtController.text = "";
                },
                decoration: InputDecoration(hintText: 'Enter a new todo item'),
              ));
        } else if (item is TodoItem) {
          return _buildTodoItem(item);
        }
        return null;
      },
    );
  }

  Widget _buildTodoItem(TodoItem item) {
    var textStyle = new TextStyle(color: Colors.black);
    if (item.isChecked) {
      textStyle = new TextStyle(
          color: Colors.grey, decoration: TextDecoration.lineThrough);
    }

    return new CheckboxListTile(
      title: new Text(item.text, style: textStyle),
      value: item.isChecked,
      onChanged: (value) {
        setState(() {
          item.isChecked = value;
        });
      },
    );
  }
}
