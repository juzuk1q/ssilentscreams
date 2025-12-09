import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class storage {
  static Future<void> saveOrder(Map<String, dynamic> data) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('order_data', jsonEncode(data));
  } // save data

  static Future<Map<String, dynamic>?> loadOrder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('order_data');
    if (data == null) return null;
    return jsonDecode(data);
  }

  static Future<void> rmData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("order_data");
  }
}