import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/pages/add_edit_note.dart';
import 'package:notes_app/widget/note_form_widget.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  bool isDark = true;
  static const String title = 'My Notes';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,

        // Define light theme data
        theme: ThemeData(
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
        ),

        // Define dark theme data
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey[850],
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.amber[600]),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.amber[600],
            titleTextStyle: GoogleFonts.rockSalt(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[850]),
            elevation: 4.0,
          ),
        ),

        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            actions: <Widget>[
              buildSwitch(context),
            ],
          ),
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AddEditNotePage(isDark: isDark)),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      );

  // Switch button widget to toggle theme mode
  Widget buildSwitch(BuildContext context) => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          activeColor: Colors.grey[850],
          //activeTrackColor: Colors.grey.shade900.withOpacity(0.5),
          value: isDark,
          onChanged: (isDark) => setState(() => this.isDark = isDark),
        ),
      );
}
