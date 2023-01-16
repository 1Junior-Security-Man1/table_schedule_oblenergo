import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  void saveUrl(String url) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Url', url);
  }

  readUrl() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('Url')!;
    return value;
  }

  void getTableColor(String arrayColor) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('List Color', arrayColor);
  }

  setTableColor() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("List Color")!;
    return value;
  }

  void getTableParam(String tableParam) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Table Param', tableParam);
  }

  setTableParam() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("Table Param")!;
    return value;
  }

  void getListParam(String listParam) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('List Param', listParam);
  }

  setListParam() async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("List Param")!;
    return value;
  }
}