import 'package:batch_256/viewmodels/list_users_viewmodel.dart';
import 'package:batch_256/views/menu/details/detailuserscreen.dart';
import 'package:batch_256/views/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:batch_256/models/list_users_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Parsing3 extends StatefulWidget {
  @override
  _Parsing3State createState() => _Parsing3State();
}

class _Parsing3State extends State<Parsing3>
    with AutomaticKeepAliveClientMixin {
  @override
  int maxPage;
  bool get wantKeepAlive => true;
  int page = 1;
  List<Datum> dataUsers = List<Datum>.empty();
  bool isLoading = false;
  //untuk handling pergerakan scroll
  ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

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
              onPressed: () {
                getListUsers(page);
              },
              child: Text(
                "GET List Users",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataUsers.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == dataUsers.length) {
                  return loadingIndicator();
                } else {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        //pindah ke detail screen
                        //1. ambil data dari model utk dibawa ke detail screen
                        Datum data = dataUsers[index];
                        //2. pindah ke detail screen
                        Navigator.push(context,
                            ScaleRoute(page: DetailUserScreen(data: data)));
                      },
                      child: Card(
                        elevation: 10.0,
                        shadowColor: CupertinoColors.white,
                        color: (index % 2 == 0)
                            ? Colors.white38
                            : Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(dataUsers[index].avatar),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${dataUsers[index].firstName} ${dataUsers[index].lastName}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Email: ${dataUsers[index].email}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
              controller: scrollController,
            ),
          ),
        ],
      ),
    );
  }

  void getListUsers(int page) async {
    setState(() {
      isLoading = true;
    });
    //get data from API
    ListUsersViewModel().getDataFromAPI(context, page).then((value) {
      setState(() {
        isLoading = false;
        if (value != null) {
          print("Hasil Baca API = $value");
          maxPage = value.totalPages;
          if (page == 1) {
            dataUsers = value.data;
          } else {
            dataUsers.addAll(value.data);
          }
        }
      });
    });
  }

  Widget loadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: new Opacity(
            opacity: isLoading ? 1.0 : 0.0,
            child: new CircularProgressIndicator()),
      ),
    );
  }

  void loadMoreData() {
    //cek page
    if (dataUsers.isNotEmpty && page < maxPage) {
      page += 1;
      getListUsers(page);
    }
  }
}
