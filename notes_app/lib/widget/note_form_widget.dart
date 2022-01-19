import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

//Color pickerColor = Colors.pink.shade100;

class NoteFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final int? number;
  final Color noteColor;
  //final Function callback;

  //final ValueChanged<String> onChangedTitle;
  //final ValueChanged<String> onChangedDescription;

  NoteFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    this.number = 0,
    required this.noteColor,
    //required this.callback,

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
  late Color noteColor;
  //late final Function callback;

  @override
  void initState() {
    super.initState();
    number = 0;
    title = '';
    description = '';
    noteColor = widget.noteColor;
    //callback = callback(noteColor);
    //print(widget.noteColor);
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
            ],
          ),
        ),
      );

  Widget buildTitle() => Material(
        borderRadius: BorderRadius.circular(10),
        color: widget.noteColor, // set color same as pickerColor
        // Wrap inside Row to add Padding on the left side
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: TextFormField(
                //sfagfafinputFormatters: [UpperCaseTextFormatter()],
                maxLines: 1,
                initialValue: title, //.toUpperCase(),
                style: GoogleFonts.shadowsIntoLightTwo(
                    //justAnotherHand
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title', //.toUpperCase(),
                  hintStyle: GoogleFonts.shadowsIntoLightTwo(
                      fontSize: 24,
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
        color: widget.noteColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: TextFormField(
                maxLines: 5,
                initialValue: description,
                style: GoogleFonts.shadowsIntoLightTwo(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something...',
                  hintStyle: GoogleFonts.shadowsIntoLightTwo(
                      fontSize: 16,
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
}
