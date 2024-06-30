import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class isdark extends ChangeNotifier{
  bool isdarckthem=false;
  void update(){
    isdarckthem=!isdarckthem;
    notifyListeners();
  }
}
Future<double> getdate(String new3) async{
  final url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
  final response = await http.get(url);
  return jsonDecode(response.body)["bpi"][new3]["rate_float"];
}
class money extends ChangeNotifier{
  double price=0;
  String new3;
  money({required this.new3});
  void updateprice(String new3) async{
    price=await getdate(new3);
    notifyListeners();
  }
}