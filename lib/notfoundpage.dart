import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "404 Not Found",
          style: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
