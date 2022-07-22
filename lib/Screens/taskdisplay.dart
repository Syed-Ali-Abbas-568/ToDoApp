import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late TextEditingController controller;
  @override
  void initstate() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: const Text("Enter New Task"),
                    content: TextField(
                        autofocus: true,
                        decoration:
                            InputDecoration(hintText: 'Enter your todo here')),
                    //controller: controller,
                    actions: [
                      TextButton(
                        child: Text('SUBMIT'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text('CANCEL'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ]),
              );
            },
            child: const Icon(Icons.add, color: Colors.yellow)),
        appBar: AppBar(
          title: const Text("My Tasks"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: Column(children: <Widget>[])));
  }
}
