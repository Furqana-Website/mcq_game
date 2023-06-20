import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/user_model.dart';

class DataService {
  static Future<List<DataModel>> loadDataFromJson() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonData);
    List<dynamic> dataList = jsonMap['data'];

    List<DataModel> dataModels = dataList.map((item) {
      return DataModel.fromJson(item);
    }).toList();

    return dataModels;
  }
}


//
  // Future<List<UserModel>?> getUsers() async {
  //   try {
  //     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<UserModel> _model = userModelFromJson(response.body);
  //       return _model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

