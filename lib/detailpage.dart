import 'package:flutter/material.dart';
import 'package:flutter_fam_web1/model/listname_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final ListNameModel data;

  const DetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateFormat.yMMMd().format(widget.data.birthDate!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        title: Text(
          "${widget.data.name} Details",
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(10),
          vertical: screenUtil.setHeight(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.data.id}"),
            Text("${widget.data.name}"),
            Text("${widget.data.desc}"),
            Text("$formattedDate"),
          ],
        ),
      ),
    );
  }
}
