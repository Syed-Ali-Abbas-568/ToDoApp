import 'package:flutter/material.dart';
import '../models/database.dart';
import '../widgets/todo_widget.dart';

class Todolist extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  final Function updateFunction;
  final db = DatabaseConnect();
  Todolist(
      {required this.insertFunction,
      required this.updateFunction,
      required this.deleteFunction,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodoInProgress(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;
          return datalength == 0
              ? const Center(
                  child: Text('no data found'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => Todocard(
                      id: data[i].id,
                      title: data[i].title,
                      creationDate: data[i].creationDate,
                      dueDate: data[i].dueDate,
                      description: data[i].description,
                      isChecked: data[i].isChecked,
                      insertFunction: insertFunction,
                      updateFunction: updateFunction,
                      delteFunction: deleteFunction),
                );
        },
      ),
    );
  }
}

class TodolistFinished extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  final Function updateFunction;
  final db = DatabaseConnect();
  TodolistFinished(
      {required this.insertFunction,
      required this.updateFunction,
      required this.deleteFunction,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodoFinished(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;
          return datalength == 0
              ? const Center(
                  child: Text('no data found'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => Todocard(
                      id: data[i].id,
                      title: data[i].title,
                      creationDate: data[i].creationDate,
                      dueDate: data[i].dueDate,
                      description: data[i].description,
                      isChecked: data[i].isChecked,
                      insertFunction: insertFunction,
                      updateFunction: updateFunction,
                      delteFunction: deleteFunction),
                );
        },
      ),
    );
  }
}
