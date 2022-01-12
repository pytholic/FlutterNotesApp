import 'package:flutter/material.dart';
//import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widget/note_form_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;
  bool isDark;

  AddEditNotePage({
    Key? key,
    this.note,
    required this.isDark,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState(isDark);
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late int number;
  late String title;
  late String description;
  bool isDark;

  _AddEditNotePageState(this.isDark);

  @override
  void initState() {
    super.initState();

    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    isDark = isDark;
  }

  static ThemeData? lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFf6f5ee),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.teal[300]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[300],
      titleTextStyle:
          GoogleFonts.rockSalt(fontSize: 20, fontWeight: FontWeight.bold),
      elevation: 4.0,
    ),
  );

  static ThemeData? darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[850],
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.amber[600]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber[600],
      titleTextStyle: GoogleFonts.rockSalt(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[850]),
      elevation: 4.0,
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: isDark
              ? darkTheme?.appBarTheme.backgroundColor
              : lightTheme?.appBarTheme.backgroundColor,
          title: Text(
            'Add/Edit Note',
            style: isDark
                ? darkTheme?.appBarTheme.titleTextStyle
                : lightTheme?.appBarTheme.titleTextStyle,
          ),
          centerTitle: true,
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: isDark ? Color(0xFF303030) : Color(0xFFf6f5ee),
            child: NoteFormWidget(
              number: number,
              title: title,
              description: description,
              // onChangedNumber: (number) => setState(() => this.number = number),
              // onChangedTitle: (title) => setState(() => this.title = title),
              // onChangedDescription: (description) =>
              //     setState(() => this.description = description),
            ),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: () {}, //addOrUpdateNote,
        child: Text('Save'),
      ),
    );
  }

  // void addOrUpdateNote() async {
  //   final isValid = _formKey.currentState!.validate();

  //   if (isValid) {
  //     final isUpdating = widget.note != null;

  //     if (isUpdating) {
  //       await updateNote();
  //     } else {
  //       await addNote();
  //     }

  //     Navigator.of(context).pop();
  //   }
  // }

  // Future updateNote() async {
  //   final note = widget.note!.copy(
  //     isImportant: isImportant,
  //     number: number,
  //     title: title,
  //     description: description,
  //   );

  //   await NotesDatabase.instance.update(note);
  // }

  // Future addNote() async {
  //   final note = Note(
  //     title: title,
  //     isImportant: true,
  //     number: number,
  //     description: description,
  //     createdTime: DateTime.now(),
  //   );

  //   await NotesDatabase.instance.create(note);
  // }
}
