import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../domain/constants/constants.dart';
import '../domain/models/userModel.dart';

class ApiService {
  Future<List<UserModel>> fetchUsers() async {
    final url = Uri.parse(baseUrl + usersEndpoint);
    List<UserModel> users = [];
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        for (var userData in responseData) {
          users.add(UserModel.fromJson(userData));
        }

        return users;
      } else {
        log('HTTP Error - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }

    return users;
  }
}
