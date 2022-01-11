import 'dart:ui';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widget/note_form_widget.dart';
import 'package:notes_app/pages/main_page.dart';

Color pickerColor = Colors.pink.shade100;

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 20.0)),
              buildTitle(),
              // Padding to add space between widgets, we can also use SizedBox
              Padding(padding: EdgeInsets.only(top: 30.0)),
              buildDescription(),
              Padding(padding: EdgeInsets.only(top: 30.0)),
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
        borderRadius: BorderRadius.circular(10),
        color: pickerColor,
        // Wrap inside Row to add Padding on the left side
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: TextFormField(
                inputFormatters: [UpperCaseTextFormatter()],
                maxLines: 1,
                initialValue: title.toUpperCase(),
                style: GoogleFonts.justAnotherHand(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title'.toUpperCase(),
                  hintStyle: GoogleFonts.justAnotherHand(
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[500]),
                ),
                validator: (title) => title != null && title.isEmpty
                    ? 'The title cannot be empty'
                    : null,
                onChanged: (pass) {}, //onChangedTitle,
              ),
            ),
          ],
        ),
      );

  Widget buildDescription() => Material(
        borderRadius: BorderRadius.circular(10),
        color: pickerColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: TextFormField(
                maxLines: 5,
                initialValue: description,
                style: GoogleFonts.shadowsIntoLightTwo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something...',
                  hintStyle: GoogleFonts.shadowsIntoLightTwo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
                validator: (title) => title != null && title.isEmpty
                    ? 'The description cannot be empty'
                    : null,
                onChanged: (pass) {}, //onChangedDescription,
              ),
            ),
          ],
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

  Widget buildColorPickerBlock() => BlockPicker(
        pickerColor: pickerColor,
        onColorChanged: (color) => setState(() => pickerColor = color),
        availableColors: [
          Colors.pink.shade100,
          Colors.orangeAccent.shade100,
          Colors.lime.shade300,
          Colors.green.shade200,
          Colors.blue.shade200,
          Colors.indigo.shade100,
          Colors.deepPurple.shade100,
          Colors.blueGrey.shade100,
        ],
      );
}
