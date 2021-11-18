import 'package:flutter/widgets.dart';
import 'package:flutter_fam_web1/model/listname_model.dart';
import 'package:mock_data/mock_data.dart';

class ListNameData extends ChangeNotifier{
  ListNameData._(){
    getData();
  }

  static final ListNameData listNameData = ListNameData._();

  List data = [];

  getData(){
    for(var i  =0; i<20;i++){
      data.add(
        ListNameModel(
          id: i.toString(),
          name: mockName('male'),
          desc: mockString(20,'a#'),
          birthDate: mockDate(DateTime(1995), DateTime(2002))
        ),
      );
    }
  }
}
