import 'package:flutter/material.dart';
import 'package:notes_app/pages/main_page.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: title,
        home: MainPage(),
      );
}
