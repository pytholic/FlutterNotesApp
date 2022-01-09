import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widget/note_form_widget.dart';
import 'package:notes_app/pages/main_page.dart';

var isDark = MainPageState().isDark;
// create some values
Color pickerColor = isDark ? Color(0xFF303030) : Color(0xFFf6f5ee);
//Color currentColor = isDark ? Color(0xFF303030) : Color(0xFFf6f5ee);
// Color pickerColor = Color(0xFF303030);
// Color currentColor = Color(0xFF303030);

class NoteFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final int? number;
  //final ValueChanged<String> onChangedTitle;
  //final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    this.number = 0,
    //required this.onChangedTitle,
    //required this.onChangedDescription,
  }) : super(key: key);

  @override
  _NoteFormWidgetState createState() => _NoteFormWidgetState();
}

class _NoteFormWidgetState extends State<NoteFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late int number;

  @override
  void initState() {
    super.initState();
    number = 0;
    title = '';
    description = '';
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          // child: Container(
          //   //color: Colors.grey[850], //currentColor,
          //   width: double.infinity,
          //   height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 10),
              buildDescription(),
              SizedBox(height: 24),
              //SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                ),
                child: Text(
                  'Pick Color',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => pickColor(context),
              ),
            ],
          ),
        ),
      );

  Widget buildTitle() => Material(
        color: pickerColor,
        child: TextFormField(
          maxLines: 1,
          initialValue: title,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Title',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The title cannot be empty'
              : null,
          onChanged: (pass) {}, //onChangedTitle,
        ),
      );

  Widget buildDescription() => Material(
        color: pickerColor,
        child: TextFormField(
          maxLines: 5,
          initialValue: description,
          style: TextStyle(color: Colors.white60, fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type something...',
            hintStyle: TextStyle(color: Colors.white60),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
          onChanged: (pass) {}, //onChangedDescription,
        ),
      );

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => color = color);
  }

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Pick your color!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              TextButton(
                child: Text('SELECT', style: TextStyle(fontSize: 20)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );

  Widget buildColorPicker() => ColorPicker(
        pickerColor: pickerColor,
        onColorChanged: (color) => setState(() => pickerColor = color),
      );
}
