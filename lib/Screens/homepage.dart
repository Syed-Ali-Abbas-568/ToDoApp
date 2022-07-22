import 'package:flutter/material.dart';
import 'package:todo_app/Screens/taskdisplay.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/logo.png')),
            const Text(
              "Welcome to Todo",
              style: TextStyle(
                  color: Color.fromARGB(255, 220, 213, 213), fontSize: 42),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TaskList()));
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.redAccent;
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
