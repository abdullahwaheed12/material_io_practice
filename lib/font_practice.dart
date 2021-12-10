import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontPractice extends StatefulWidget {
  FontPractice({Key? key}) : super(key: key);

  @override
  _FontPracticeState createState() => _FontPracticeState();
}

class _FontPracticeState extends State<FontPractice> {
  @override
  Widget build(BuildContext context) {
    var style = GoogleFonts.aBeeZee();
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello world',
        ),
      ),
    );
  }
}
