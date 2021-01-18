import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Products with ChangeNotifier {

  Map<String, List> userAllData = {};

  void addText(var data) {
    final dateLogic = DateTime.now();
    final dateNow = DateFormat('yyyyMMdd').format(dateLogic);
    int difference = dateLogic.difference(DateTime.parse(data['date'])).inDays;
    final dateKey = DateFormat('yyyyMMdd')
        .format(DateTime.parse(dateNow).subtract(Duration(days: difference)));
    print(dateKey);

    if (userAllData.containsKey(dateKey) == true) {
      userAllData[dateKey].add(data);
    } else {
      userAllData.addAll({dateKey: [data]});
    }
    print(userAllData);
    notifyListeners();
  }

  void removeText(DateTime data, int removeIndex, Map removeData) {
    String checkKey = DateFormat('yyyyMMdd').format(data);
    if (userAllData.containsKey(checkKey) == true) {
      print("성공");
      for(int a=0; a< userAllData[checkKey].length;a++){
        if(userAllData[checkKey][a] == removeData){
          userAllData[checkKey].removeAt(a);
        }
      }
    }
    notifyListeners();
  }
}

/*

    int difference = dateNow.difference(DateTime.parse(data['date'])).inDays;
    print(dateNow.subtract(Duration(days: difference)).isUtc);

    if(userAllData.containsKey(dateNow.subtract(Duration(days: difference)).isUtc)==true){
      print("이삭");
       userAllData.update(dateNow.subtract(Duration(days: difference)), (value) => [data]);
    }else{
      userAllData.addAll({dateNow.subtract(Duration(days: difference)): [data]});

    }
    print(userAllData);

*/
