import 'package:batch_256/components/custom_snackbar.dart';
import 'package:batch_256/models/response_unsuccessful.dart';
import 'package:batch_256/utilities/networking/networking_response.dart';
import 'package:batch_256/utilities/repository/api_repository.dart';
import 'package:batch_256/models/list_users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListUsersViewModel {
  ListUsersViewModel();

  Future<ListUsersModel> getDataFromAPI(BuildContext context, int page) async {
    NetworkingResponse response = await APIRepository().getListUser(page);

    if (response is NetworkingSuccess) {
      if (response.StatusCode == 200) {
        //proses datanya
        ListUsersModel model = listUsersModelFromJson(response.body);

        return model;
      } else {
        //ada sesuatu?
        print("Status Code : ${response.StatusCode}");
        print("Message : ${response.body}");

        ResponseUnsuccess unsuccess = responseUnsuccessFromJson(response.body);
        String message =
            unsuccess.message + " [" + response.StatusCode.toString() + "]";

        //informasikan ke user problemnya
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(message));
      }
    } else if (response is NetworkingException) {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar(response.message));
      return null;
    }
  }
}
