abstract class ListItem {}

class TodoItem extends ListItem {
  final String text;

  TodoItem(this.text);
}

class EditTextItem extends ListItem {}
