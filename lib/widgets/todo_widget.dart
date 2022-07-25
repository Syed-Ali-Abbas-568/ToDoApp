//import 'dart:html';

import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'package:intl/intl.dart';

class Todocard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;

  final Function insertFunction;
  final Function updateFunction;
  final Function delteFunction;
  Todocard(
      {required this.id,
      required this.title,
      required this.creationDate,
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
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
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
                Text(widget.title),
                const SizedBox(height: 5),
                Text(
                  DateFormat('dd MMM yyyy - hh:mm aaa')
                      .format(widget.creationDate),
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
                  content: TextField(
                    controller: textController,
                    decoration:
                        InputDecoration(hintText: 'Write New Description here'),
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
                            creationDate: widget.creationDate,
                            isChecked: widget.isChecked);

                        widget.updateFunction(tempTodo);
                        Navigator.pop(context, false);
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              );
              //widget.updateFunction(anotherTodo);
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
                            'This To-do will be deleted forever.Do you want to procced?'),
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
