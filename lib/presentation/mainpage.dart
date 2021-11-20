import 'package:flutter/material.dart';
import 'package:flutter_fam_web1/data/listname_data.dart';
import 'package:flutter_fam_web1/detailpage.dart';
import 'package:flutter_fam_web1/model/listname_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        title: Text(
          "Main page of Website",
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
      ),
      body: Consumer(
        builder: (context, ListNameData data, _) => ListView.builder(
          shrinkWrap: true,
          itemCount: data.data.length,
          itemBuilder: (context, index) {
            ListNameModel listNameModel = data.data[index];
            return ListTile(
              title: Text("${listNameModel.name}"),
              subtitle: Text("${listNameModel.desc}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DetailPage(
                      data: listNameModel,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
