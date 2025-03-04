import 'dart:async';
import 'todo_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'todo_item.dart';

part 'database.g.dart';


@Database(version: 1, entities: [TodoItem])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}