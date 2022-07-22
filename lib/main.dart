import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.bowlbyOneScTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 68, 66, 66),
      ),
      home: const HomePage(),
    );
  }
}
