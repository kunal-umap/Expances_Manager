
import 'package:expances_management/Pages/Transaction_Page/MoreDetail/MoreDetailWidget/indicator.dart';
import 'package:flutter/material.dart';

class DataName extends StatelessWidget {
  final data;
  const DataName({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final category = {};
    List name = [];
    for(int i = 0;i<data.length;i++){
      if(category[data[i]['category']] != null){
        category[data[i]['category']] +=  int.parse(data[i]['amount']);
      }else {
        name.add(data[i]['category']);
        category[data[i]['category']] = int.parse(data[i]['amount']);
      }
    }
    List col = [Colors.greenAccent,Colors.blueAccent,Colors.pinkAccent,Colors.purpleAccent];

    return ListView.builder(

      shrinkWrap: true,
      itemCount: name.length,
      itemBuilder: (context,index) {
        return  Indicator(
          color: col[index],
          text: name[index],
          isSquare: true,
        );
      }
    );

  }
}
