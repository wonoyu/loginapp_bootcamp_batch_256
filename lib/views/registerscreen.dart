import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int genderRadioValue = 0;
  String valuePekerjaan;
  String valuePendidikan;
  String valueHobi;

  List<Color> orangeGradients = [
    Color(0xFFFF9844),
    Color(0xFFFE8853),
    Color(0xFFFD7267),
  ];

  List itemPekerjaan = [
    "Designer",
    "Programmer",
    "Business Analyst",
    "Software Expert",
    "Project Manager",
    "SCRUM Master",
    "Database Engineer",
  ];
  List itemPendidikan = [
    "SD",
    "SMP",
    "SMA/Sederajat",
    "D3",
    "S1",
    "S2",
    "S3",
  ];
  List itemHobi = [
    "Berenang",
    "Membaca buku",
    "Bersepeda",
    "Touring",
    "Gaming",
    "Mountaineering",
  ];

  bool agreeValue = false;
  String tanggalLahir = '--';
  DateTime tanggalTerpilih = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.lightBlue[100],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Registration Form"),
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/regformbg.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              width: size.width,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      maxLength: 50,
                      decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          hintStyle: TextStyle(color: Colors.orange)),
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Usia",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      elevation: 10.0,
                      color: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextField(
                          maxLength: 16,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Nomor Telp/HP",
                            hintStyle: TextStyle(color: Colors.orange),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      elevation: 10.0,
                      color: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextField(
                          maxLength: 30,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.orange),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Jenis Kelamin"),
                        Row(
                          children: <Widget>[
                            new Radio(
                              value: 0,
                              groupValue: genderRadioValue,
                              onChanged: handleRadioClick,
                            ),
                            Text("Laki-laki"),
                            new Radio(
                              value: 1,
                              groupValue: genderRadioValue,
                              onChanged: handleRadioClick,
                            ),
                            Text("Perempuan"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jenis Pekerjaan"),
                        Container(
                          width: size.width,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              hint: Text("-Silahkan Pilih-"),
                              isExpanded: true,
                              value: valuePekerjaan,
                              items: itemPekerjaan.map((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  valuePekerjaan = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pendidikan"),
                        DropdownButton(
                          hint: Text("-Silahkan Pilih-"),
                          value: valuePendidikan,
                          items: itemPendidikan.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valuePendidikan = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hobi"),
                        DropdownButton(
                          hint: Text("-Silahkan Pilih-"),
                          value: valueHobi,
                          items: itemHobi.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valueHobi = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pilih Tanggal Lahir"),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                pilihTanggalLahir(context);
                              },
                            ),
                            Text(
                              '$tanggalLahir',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text(
                      "Dengan melakukan registrasi, "
                      "berarti Anda telah menyetujui syarat dan ketentuan yang berlaku,"
                      " Silahkan centang jika Anda setuju!",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CheckboxListTile(
                      title: Text("Saya setuju"),
                      value: agreeValue,
                      onChanged: (newValue) {
                        setState(() {
                          agreeValue = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: agreeValue ? () => sayaSetuju() : null,
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void pilihTanggalLahir(BuildContext context) async {
    final DateTime picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2022));

    if (picker != null && picker != tanggalTerpilih) {
      setState(() {
        tanggalTerpilih = picker;

        //konversi datetime menjadi string
        tanggalLahir = DateFormat("dd-MM-yyyy").format(tanggalTerpilih);
      });
    }
  }

  sayaSetuju() {
    //validasi data skipped
    Navigator.of(context).pop();
  }

  void handleRadioClick(int value) {
    setState(() {
      genderRadioValue = value;
    });

    switch (genderRadioValue) {
      case 0:
        Fluttertoast.showToast(
            msg: "Anda memilih gender laki-laki",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT);
        break;
      case 1:
        Fluttertoast.showToast(
            msg: "Anda memilih gender perempuan",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT);
        break;
    }
  }
}
