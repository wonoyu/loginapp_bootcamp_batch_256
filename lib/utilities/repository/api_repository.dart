import 'dart:convert';

import 'package:batch_256/utilities/networking/networking_connector.dart';
import 'package:batch_256/utilities/networking/networking_response.dart';
import '../configuration.dart';

class APIRepository {
  //semua yang berhubungan dengan API
  //1. API untuk get list users
  Future<NetworkingResponse> getListUser(int page) {
    String url = API_BASE_URL;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };

    Map<String, String> queryParameters = {'page': '$page'};
    return NetworkingConnector()
        .getRequest(url, END_POINT_LIST_USERS, headerRequest, queryParameters);
  }

  //API untuk create user
  Future<NetworkingResponse> createUser(String name, String job) {
    String url = API_BASE_URL + END_POINT_CREATE_USER;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };

    final bodyRequest = jsonEncode({"name": name, "job": job});

    return NetworkingConnector().postRequest(url, headerRequest, bodyRequest);
  }

  //API untuk login user
  Future<NetworkingResponse> loginUser(String email, String password) {
    String url = API_BASE_URL + END_POINT_LOGIN_USER;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };

    final bodyRequest = jsonEncode({"email": email, "password": password});

    return NetworkingConnector().postRequest(url, headerRequest, bodyRequest);
  }
}
