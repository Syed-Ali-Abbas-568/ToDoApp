import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:path/path.dart';

import '../models/todo_model.dart';

// ignore: must_be_immutable
class UserInput extends StatelessWidget {
  var textController = TextEditingController();
  var descriptionController = TextEditingController();
  final Function insertFuntion;
  final Function updateFunction;

  UserInput(
      {required this.insertFuntion, required this.updateFunction, Key? key})
      : super(key: key);

//   showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2020),
//         lastDate: DateTime(2030))
//     .then((pickedDate) {
//   if (pickedDate == null) {
//     return;
//   }
//   setState(() {
//     selectedDate = pickedDate;
//   });
// });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        color: const Color.fromARGB(249, 233, 233, 233),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'write todo title here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: 'write todo description here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //will have to add widget to insert date and time
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if (textController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("ERROR:"),
                      content: const Text('Title of a task cannot be empty'),
                      actions: <Widget>[
                        FlatButton(
                            textColor: Colors.black,
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('OK')),
                      ],
                    ),
                  );
                }

                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Add Due Date'),
                          actions: <Widget>[
                            FlatButton(
                                textColor: Colors.black,
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel')),
                            FlatButton(
                              textColor: Colors.red,
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text('Add Task'),
                            ),
                          ],
                        ));
                if (textController.text.isEmpty) {
                  Navigator.pop(context, false);
                } else {
                  var myTodo = Todo(
                      title: textController.text,
                      description: descriptionController.text,
                      creationDate: DateTime.now(),
                      dueDate: DateTime
                          .now(), //Will take input from date and time widget here
                      isChecked: false);
                  insertFuntion(myTodo);
                  updateFunction(myTodo);
                }
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

//   showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2020),
//         lastDate: DateTime(2030))
//     // ignore: use_function_type_syntax_for_parameters
//     .then((pickedDate) {
//   if (pickedDate == null) {
//     return;
//   }
//   setState(() {
//     selectedDate = pickedDate;
//   });
// });

}




// class DatePicker extends StatefulWidget {
//   const DatePicker({Key? key}) : super(key: key);

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//       TextButton(
//         onPressed: (){}, 
//         child: null,
//         style: ,
        
        
//         )


//       ],

//     );
//   }
// }
