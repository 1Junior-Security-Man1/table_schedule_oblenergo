import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/data/table_colors.dart';

class LocalStorage {

  void saveData(String data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Data', data);
  }

  readData() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('Data') ?? '';
    return value;
  }

  void getTableColor(String arrayColor) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('List Color', arrayColor);
  }
///
  void getListParam(TableColors endLightObj) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ListParam', jsonEncode(endLightObj));
  }

  setListParam() async {
    final prefs = await SharedPreferences.getInstance();
    var value = jsonDecode(prefs.getString('ListParam')!);
    return value;
  }
///
  setTableColor() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("List Color")!;
    return value;
  }

  void getTableParam(String willBeLight, String willBeNoLight) async{
    List<String> light = [willBeLight, willBeNoLight];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Table Param', jsonEncode(light));
  }

  setTableParam() async {
    final prefs = await SharedPreferences.getInstance();
    String value = jsonDecode(prefs.getString('Table Param')!);
    return value;
  }

  // void getListParam(String listParam) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('List Param', listParam);
  // }
  //
  // setListParam() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String value = prefs.getString("List Param")!;
  //   return value;
  // }
}