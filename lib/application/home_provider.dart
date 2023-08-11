import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  List users = [];
  final uri = "https://api.nstack.in/v1/todos";

  Future<void> fetchTodoAllList() async {
    // final uri1 = "https://api.nstack.in/v1/todos?limit=20";
    final url = Uri.parse(uri);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body) as Map;
        users = responseData["items"];
        print(users.toList());
        notifyListeners();
      } else {
        log('HTTP Error - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
    notifyListeners();
  }

  void onSubmit(String title, String description) async {
    final data = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    final url = Uri.parse(uri);
    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(response.statusCode);
    if (response.statusCode == 201) {
      debugPrint('Data Created');
    } else {
      debugPrint('Faild to Create data');
    }
    log(response.body.toString());
    fetchTodoAllList();
    notifyListeners();
  }

  Future<void> deleteTodo(String id) async {
    final duri = "https://api.nstack.in/v1/todos/$id";
    final url = Uri.parse(duri);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      users = users.where((element) => element['_id'] != id).toList();
      print('deleted');
    } else {
      print('Error while deleting the todo');
    }
    notifyListeners();
  }
}
