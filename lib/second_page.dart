import 'package:flutter/material.dart';
import 'package:w25_class_demos/data_repo.dart';
import 'package:w25_class_demos/database.dart';
import 'package:w25_class_demos/todo_dao.dart';
import 'package:w25_class_demos/todo_item.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var words = <TodoItem>[];

  late TodoDao myDAO;

  final TextEditingController _input = TextEditingController();

  @override
  void initState() {
    super.initState();

    $FloorAppDatabase.databaseBuilder("app_database.db").build().then((database){
      myDAO = database.todoDao;
      myDAO.getAllItems().then((listOfItems){
        setState(() {
          words.clear();
          words.addAll(listOfItems);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome to the Second Page " + DataRepository.loginName),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _input,
                    decoration: InputDecoration(hintText: "Type here"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_input.value.text.isNotEmpty) {
                        setState(() {
                          var newItem = TodoItem(TodoItem.ID++, _input.value.text);
                          myDAO.insertItem(newItem);
                          words.add(newItem);
                          _input.text = "";
                        });
                      } else {
                        const snackBar =
                            SnackBar(content: Text("Please input something"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text("Add Item"))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: words.length,
                  itemBuilder: (context, rowNum) {
                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Delete?"),
                                content: Text(
                                    "Are you sure you want to delete the row?"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          myDAO.deleteItem(words[rowNum]);
                                          words.removeAt(rowNum);
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }, child: Text("No"))
                                ],
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Row Number: $rowNum"),
                          Text(words[rowNum].todoItem)
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
