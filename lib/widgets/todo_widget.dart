//import 'dart:html';

import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'package:intl/intl.dart';

class Todocard extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final DateTime creationDate;
  final DateTime dueDate;
  bool isChecked;

  final Function insertFunction;
  final Function updateFunction;
  final Function delteFunction;
  Todocard(
      {required this.id,
      required this.title,
      required this.description,
      required this.creationDate,
      required this.dueDate,
      required this.isChecked,
      required this.insertFunction,
      required this.updateFunction,
      required this.delteFunction,
      Key? key})
      : super(key: key);
  @override
  _TodocardState createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  var textController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        description: widget.description,
        creationDate: widget.creationDate,
        dueDate: widget.dueDate,
        isChecked: widget.isChecked);

    return Card(
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title:'),
                Text(
                  widget.title,
                  style: const TextStyle(fontFamily: 'RobotoMono'),
                ),
                const Text('Description:'),
                Text(
                  widget.description,
                  style: const TextStyle(fontFamily: 'RobotoMono'),
                ),
                const SizedBox(height: 5),
                const Text('Creation Date:'),
                Text(
                  DateFormat('dd MMM yyyy - hh:mm aaa')
                      .format(widget.creationDate),
                  style: const TextStyle(fontFamily: 'RobotoMono'),
                ),
                const Text('Due Date:'),
                Text(
                  DateFormat('dd MMM yyyy - hh:mm aaa').format(widget.dueDate),
                  style: const TextStyle(fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Update this todo'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: textController,
                        style: const TextStyle(fontFamily: 'RobotoMono'),
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          floatingLabelStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: descriptionController,
                        style: const TextStyle(fontFamily: 'RobotoMono'),
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          floatingLabelStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                        textColor: Colors.black,
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel')),
                    FlatButton(
                      textColor: Colors.red,
                      onPressed: () {
                        var tempTodo = Todo(
                            id: widget.id,
                            title: textController.text,
                            description: descriptionController.text,
                            creationDate: widget.creationDate,
                            dueDate: widget.dueDate,
                            isChecked: widget.isChecked);

                        widget.updateFunction(tempTodo);
                        Navigator.pop(context, false);
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text(
                            'This To-do will be deleted forever.Do you want to proceed?'),
                        actions: <Widget>[
                          FlatButton(
                              textColor: Colors.black,
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel')),
                          FlatButton(
                            textColor: Colors.red,
                            onPressed: () {
                              widget.delteFunction(anotherTodo);
                              Navigator.pop(context, false);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ));
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
