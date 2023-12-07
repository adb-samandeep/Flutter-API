import 'package:api/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class ApiPutServices extends ChangeNotifier {
  Future<void> updateUserDetails({int? id, UsersModel? body}) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseURL + ApiConstants.userEndpoint}/$id');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode != 201) {
        Get.rawSnackbar(message: 'Failed to create data');
      }
      notifyListeners();
    } catch (e) {
      print('Exception::$e');
      Get.rawSnackbar(message: 'Something went wrong, try again');
    }
  }
}
