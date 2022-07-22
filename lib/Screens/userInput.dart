import 'package:flutter/material.dart';

import '../models/todo_model.dart';

// ignore: must_be_immutable
class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  final Function insertFuntion;

  UserInput({required this.insertFuntion, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        color: const Color.fromARGB(249, 233, 233, 233),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'write new todo here...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                var myTodo = Todo(
                    title: textController.text,
                    creationDate: DateTime.now(),
                    isChecked: false);
                insertFuntion(myTodo);
              },
              child: Container(
                color: Colors.lightGreen,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                child: const Text('Add'),
              ),
            )
          ],
        ));
  }
}
