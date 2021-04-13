import 'package:batch_256/components/custom_snackbar.dart';
import 'package:batch_256/viewmodels/create_users_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:batch_256/models/list_users_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DetailUserScreen extends StatefulWidget {
  //buat constructor untuk handle passing data dari list
  final Datum data;
  DetailUserScreen({this.data});
  @override
  _DetailUserScreenState createState() => _DetailUserScreenState();
}

//karena ada custom constructor, maka extends state nya
//menggunakan <DetailUserScreen> agar data bisa dibaca
class _DetailUserScreenState extends State<DetailUserScreen> {
  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerJob = new TextEditingController();
  ProgressDialog loading;

  @override
  Widget build(BuildContext context) {
    loading = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    loading.style(
      message: "Mohon tunggu....",
      messageTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      progressWidget: CircularProgressIndicator.adaptive(),
      borderRadius: 15.0,
      elevation: 15.0,
      insetAnimCurve: Curves.easeInOutBack,
      backgroundColor: Colors.white38,
    );
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: Text("Detail Screen"),
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Center(
                  // child: Image.network(
                  //   widget.data.avatar,
                  //   width: 150,
                  //   height: 150,
                  // ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.data.avatar,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.data.firstName} ${widget.data.lastName}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.data.email}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 10.0,
                  color: Colors.white38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerName,
                      decoration: InputDecoration(hintText: "Input Name"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 10.0,
                  color: Colors.white38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _controllerJob,
                      decoration: InputDecoration(hintText: "Input Job"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 10.0,
                  color: Colors.white38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      validateInput(_controllerName.text.trim(),
                          _controllerJob.text.trim());
                    },
                    child: Text("Create User",
                        style: TextStyle(color: Colors.black87)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateInput(String name, String job) {
    if (name.isNotEmpty && job.isNotEmpty) {
      //kirim ke API
      createUser(name, job);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar("Semua input harus di isi!"));
    }
  }

  void createUser(String name, String job) async {
    //tampilkan loadin
    await loading.show();
    //send data to API
    CreateUsersViewModel().postDataToAPI(context, name, job).then((value) {
      setState(() {
        //tutup loading
        loading.hide();

        if (value != null) {
          print("Respon Balikan API = $value");
          String id = value.id;
          String name = value.name;
          String job = value.job;
          String createdAt = value.createdAt.toString();

          ScaffoldMessenger.of(context).showSnackBar(
              customSnackBarWithTitle(id, '$name \n $job, $createdAt'));
        }
      });
    });
  }
}
