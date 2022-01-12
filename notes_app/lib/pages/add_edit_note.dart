import 'package:flutter/material.dart';
//import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widget/note_form_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;
  final bool isDark;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const AddEditNotePage({
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
  late Color pickerColor;
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
    pickerColor = Colors.yellow.shade100;
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
          actions: <Widget>[
            Transform.scale(
              scale: 2,
              child: IconButton(
                onPressed: () => pickColor(context),
                //icon: Icon(Icons.color_lens),
                icon: Image.asset('./assets/icons/color_picker_icon.png'),
                color: isDark ? Colors.grey[850] : Colors.white,
                splashRadius: 15,
              ),
            ),
          ],
          leading: BackButton(
            color: isDark ? Colors.grey[850] : Colors.white,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: isDark ? Color(0xFF303030) : Color(0xFFf6f5ee),
            child: Column(
              children: [
                buildNoteWidget(context),
                buildButton(),
              ],
            ),
          ),
        ),
      );

  Widget buildNoteWidget(BuildContext context) {
    return NoteFormWidget(
      number: number,
      title: title,
      description: description,
      noteColor: pickerColor,
      onChangedColor: (color) => setState(() => pickerColor = color),
    );
  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: SizedBox(
        width: 110.0,
        height: 40.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: isDark ? Colors.grey[850] : Colors.white,
            primary: isFormValid
                ? null
                : (isDark
                    ? darkTheme.floatingActionButtonTheme.backgroundColor
                    : lightTheme.floatingActionButtonTheme.backgroundColor),
          ),
          onPressed: () {}, //addOrUpdateNote,
          child: Text(
            'Save',
            style: GoogleFonts.rockSalt(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.grey[850] : Colors.white),
          ),
        ),
      ),
    );
  }

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Pick your color!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPickerBlock(),
              TextButton(
                child: Text('SELECT', style: TextStyle(fontSize: 20)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );

  Widget buildColorPickerRGB() => ColorPicker(
        pickerColor: pickerColor,
        enableAlpha: false, // hides alpha channel slider
        labelTypes: [], // hides extra text in color picker like rgb values
        onColorChanged: (color) => setState(() => pickerColor = color),
      );

  Widget buildColorPickerBlock() => Flexible(
        child: BlockPicker(
          pickerColor: pickerColor,
          onColorChanged: (color) => setState(() => pickerColor = color),
          availableColors: [
            Colors.yellow.shade100,
            Colors.pink.shade100,
            Colors.orangeAccent.shade100,
            Colors.lime.shade300,
            Colors.green.shade200,
            Colors.blue.shade200,
            Colors.indigo.shade100,
            Colors.deepPurple.shade100,
            Colors.blueGrey.shade100,
          ],
        ),
      );

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
