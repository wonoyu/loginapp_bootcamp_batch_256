import 'dart:convert';
import 'package:batch_256/components/custom_snackbar.dart';
import 'package:batch_256/models/create_users_model.dart';
import 'package:batch_256/models/login_model.dart';
import 'package:batch_256/models/response_unsuccessful.dart';
import 'package:batch_256/utilities/networking/networking_response.dart';
import 'package:batch_256/utilities/repository/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginUserViewModel {
  LoginUserViewModel();

  Future<LoginModel> postDataToAPI(
      BuildContext context, String email, String password) async {
    NetworkingResponse response =
        await APIRepository().loginUser(email, password);
    if (response is NetworkingSuccess) {
      if (response.StatusCode == 200) {
        LoginModel model = loginModelFromJson(response.body);

        return model;
      } else if (response.StatusCode == 400) {
        var error = jsonDecode(response.body);
        print("Status Code HTTP : ${response.StatusCode}");
        print("Message: ${response.body}");

        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackBar(error['error']));

        return null;
      } else {
        print("Status Code HTTP : ${response.StatusCode}");
        print("Message: ${response.body}");

        ResponseUnsuccess responseUnsuccess =
            responseUnsuccessFromJson(response.body);

        String message = responseUnsuccess.message + "[${response.StatusCode}]";
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(message));
        return null;
      }
    } else if (response is NetworkingException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar(response.message));
    }
  }
}
