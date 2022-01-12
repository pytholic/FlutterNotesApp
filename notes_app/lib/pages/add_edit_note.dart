import 'package:flutter/material.dart';
//import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widget/note_form_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;
  bool isDark;
  ThemeData lightTheme;
  ThemeData darkTheme;

  AddEditNotePage({
    Key? key,
    this.note,
    required this.isDark,
    required this.lightTheme,
    required this.darkTheme,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() =>
      _AddEditNotePageState(isDark, lightTheme, darkTheme);
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late int number;
  late String title;
  late String description;
  bool isDark;
  ThemeData lightTheme;
  ThemeData darkTheme;

  _AddEditNotePageState(this.isDark, this.lightTheme, this.darkTheme);

  @override
  void initState() {
    super.initState();

    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    isDark = isDark;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: isDark
              ? darkTheme.appBarTheme.backgroundColor
              : lightTheme.appBarTheme.backgroundColor,
          title: Text(
            'Add/Edit Note',
            style: isDark
                ? darkTheme.appBarTheme.titleTextStyle
                : lightTheme.appBarTheme.titleTextStyle,
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
