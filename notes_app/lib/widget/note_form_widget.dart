import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

//Color pickerColor = Colors.pink.shade100;

class NoteFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final int? number;
  Color noteColor;
  final ValueChanged<Color> onChangedColor;
  //final ValueChanged<String> onChangedTitle;
  //final ValueChanged<String> onChangedDescription;

  NoteFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    this.number = 0,
    required this.noteColor,
    required this.onChangedColor,
    //required this.onChangedTitle,
    //required this.onChangedDescription,
  }) : super(key: key);

  @override
  _NoteFormWidgetState createState() =>
      _NoteFormWidgetState(noteColor, onChangedColor);
}

class _NoteFormWidgetState extends State<NoteFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late int number;
  late Color noteColor;
  late ValueChanged<Color> onChangedColor;

  _NoteFormWidgetState(this.noteColor, this.onChangedColor);

  @override
  void initState() {
    super.initState();
    number = 0;
    title = '';
    description = '';
    //noteColor = noteColor;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.only(top: 20.0)),
              buildTitle(noteColor),
              // Padding to add space between widgets, we can also use SizedBox
              Padding(padding: EdgeInsets.only(top: 30.0)),
              buildDescription(noteColor),
              // Padding(padding: EdgeInsets.only(top: 30.0)),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 24),
              //   ),
              //   child: Text(
              //     'Pick Color',
              //     style: TextStyle(fontSize: 24),
              //   ),
              //   onPressed: () => pickColor(context),
              // ),
            ],
          ),
        ),
      );

  Widget buildTitle(Color color) => Material(
        borderRadius: BorderRadius.circular(10),
        color: color,
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

  Widget buildDescription(Color color) => Material(
        borderRadius: BorderRadius.circular(10),
        color: color,
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

  // void pickColor(BuildContext context) => showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Pick your color!'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             buildColorPickerBlock(),
  //             TextButton(
  //               child: Text('SELECT', style: TextStyle(fontSize: 20)),
  //               onPressed: () => Navigator.of(context).pop(),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  // Widget buildColorPickerRGB() => ColorPicker(
  //       pickerColor: pickerColor,
  //       enableAlpha: false, // hides alpha channel slider
  //       labelTypes: [], // hides extra text in color picker like rgb values
  //       onColorChanged: (color) => setState(() => pickerColor = color),
  //     );

  // Widget buildColorPickerBlock() => BlockPicker(
  //       pickerColor: pickerColor,
  //       onColorChanged: (color) => setState(() => pickerColor = color),
  //       availableColors: [
  //         Colors.yellow.shade100,
  //         Colors.pink.shade100,
  //         Colors.orangeAccent.shade100,
  //         Colors.lime.shade300,
  //         Colors.green.shade200,
  //         Colors.blue.shade200,
  //         Colors.indigo.shade100,
  //         Colors.deepPurple.shade100,
  //         Colors.blueGrey.shade100,
  //       ],
  //     );
}
