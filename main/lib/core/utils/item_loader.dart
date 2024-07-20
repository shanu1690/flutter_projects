import 'dart:convert';

import 'package:flutter/services.dart';

class ItemLoader {
  Future<Map<String,dynamic>> loadItems() async {
    String response = await rootBundle.loadString("assets/drawer_item.json");
    return jsonDecode(response);
  }
}
