import 'package:floor/floor.dart';

@entity
class TodoItem {
  static int ID = 1;

  @primaryKey
  final int id;
  final String todoItem;

  TodoItem(this.id, this.todoItem){
    if(id > ID) {
      ID = id + 1;
    }
  }
}