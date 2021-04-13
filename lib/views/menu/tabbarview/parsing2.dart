import 'dart:convert';
import 'package:batch_256/components/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class Parsing2 extends StatefulWidget {
  @override
  _Parsing2State createState() => _Parsing2State();
}

class _Parsing2State extends State<Parsing2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int responseCode = 0;
  List dataUsers;

  ProgressDialog loading;
  @override
  Widget build(BuildContext context) {
    //constructor loading progress dialog
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
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/yonkou.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.white38,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextButton(
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                get10Users();
              },
              child: Text(
                "Get 10 Users",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("HTTP Response Code = $responseCode"),
          Expanded(
            child: ListView.builder(
                itemCount: dataUsers == null ? 0 : dataUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: InkWell(
                      child: Card(
                        elevation: 10.0,
                        margin: EdgeInsets.all(5),
                        color: (index % 2 == 0)
                            ? Colors.white38
                            : Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Nama: ${dataUsers[index]['name']} (${dataUsers[index]['username']})",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: (index % 2 == 0)
                                      ? Colors.black87
                                      : Colors.white54),
                            ),
                            Text(
                              "Email: ${dataUsers[index]['email']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (index % 2 == 0)
                                      ? Colors.black87
                                      : Colors.white54),
                            ),
                            Text(
                              "Alamat: ${dataUsers[index]['address']['street']}"
                              "${dataUsers[index]['address']['suite']}"
                              "${dataUsers[index]['address']['city']}"
                              "${dataUsers[index]['address']['zipcode']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: (index % 2 == 0)
                                      ? Colors.black87
                                      : Colors.white54),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        //aksi spesifik saat card di tap
                        String lat = dataUsers[index]['address']['geo']['lat'];
                        String lng = dataUsers[index]['address']['geo']['lng'];
                        String username = dataUsers[index]['username'];
                        //panggil & tampilkan snackbar
                        ScaffoldMessenger.of(context)
                            .showSnackBar(customSnackBarWithTitle(
                          username,
                          'lat = $lat, lng = $lng',
                        ));
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<String> get10Users() async {
    await loading.show();

    final String urlAPI = "https://jsonplaceholder.typicode.com/users";

    var request = await http.get(Uri.parse(urlAPI), headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    });

    var response = request.body;

    setState(() {
      responseCode = request.statusCode;
      //konversi response body string menjadi list JSON supaya di parsing kemudian
      dataUsers = json.decode(response);

      //tutup loading
      loading.hide();
    });
  }
}
