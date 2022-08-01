// ignore: duplicate_ignore
// ignore: file_names

import 'package:flutter/material.dart';

import '../Screens/userInput.dart';

import '../models/database.dart';
import '../models/todo_model.dart';
import '../widgets/todo_list_data.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  var textController = TextEditingController();
  //hmmm
  var db = DatabaseConnect();
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.delteTodo(todo);
    setState(() {});
  }

  void updateItem(Todo todo) async {
    await db.UpdateTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 64, 64),
          title: const Text("My To-Do!", style: TextStyle(fontSize: 24)),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'In-Progress',
                icon: Icon(Icons.timer_rounded),
              ),
              Tab(
                text: 'Completed',
                icon: Icon(Icons.check),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Todolist(
                      insertFunction: addItem,
                      updateFunction: updateItem,
                      deleteFunction: deleteItem,
                    ),
                  ),
                  Center(
                    child: TodolistFinished(
                      insertFunction: addItem,
                      updateFunction: updateItem,
                      deleteFunction: deleteItem,
                    ),
                  ),
                ],
              ),
            ),
            UserInput(
              insertFuntion: addItem,
              updateFunction: updateItem,
            ),
          ],
        ),
      ),
    );
  }
}
