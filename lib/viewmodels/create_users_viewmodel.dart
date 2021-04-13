import 'package:batch_256/components/custom_snackbar.dart';
import 'package:batch_256/models/create_users_model.dart';
import 'package:batch_256/models/response_unsuccessful.dart';
import 'package:batch_256/utilities/networking/networking_response.dart';
import 'package:batch_256/utilities/repository/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateUsersViewModel {
  CreateUsersViewModel();

  Future<CreateUsersModel> postDataToAPI(
      BuildContext context, String name, String job) async {
    NetworkingResponse response = await APIRepository().createUser(name, job);
    if (response is NetworkingSuccess) {
      if (response.StatusCode == 201) {
        CreateUsersModel model = createUsersModelFromJson(response.body);

        return model;
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
