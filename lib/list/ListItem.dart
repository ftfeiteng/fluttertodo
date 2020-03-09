abstract class ListItem {}

class TodoItem extends ListItem {
  final String text;
  var isChecked = false;

  TodoItem(this.text);
}

class EditTextItem extends ListItem {}
