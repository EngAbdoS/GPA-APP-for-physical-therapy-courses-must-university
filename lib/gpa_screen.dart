import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Widget flutterrad(int hour, titel, int ind) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlutterRadioGroup(
              titles: _listHorizontal,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
              labelVisible: true,
              label: titel,
              activeColor: Colors.blue,
              titleStyle: TextStyle(fontSize: 14),
              defaultSelected: _indexHorizontal,
              orientation: RGOrientation.VERTICAL,
              onChanged: (index) {
                setState(() {
                  dg[ind] = (gp[index] * hour);
                  if (index == 10) {
                    h[ind] = 0;
                  } else {
                    h[ind] = hour;
                  }
                  print("${dg[ind]}+${h[ind]}=$ind");
                  _indexHorizontal = index;
                });
              }),
        ),
      ),
    );
  }

  var _listHorizontal = [
    'A',
    'A-',
    'B+',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'كحكة',
    'Not Registered'
  ];

  var _indexHorizontal = 0;

  var gp = [4.0, 3.7, 3.3, 3.0, 2.3, 2.0, 1.7, 1.3, 1.0, 0.0, 0.0];

  List dg = [4, 12, 12, 12, 4, 12, 12, 12, 12, 12];

  List h = [1, 3, 3, 3, 1, 3, 3, 3, 3, 3];

  var totalgpa = 0.0, totalhour = 0.0, gpa_resultt = 0.0;
  bool mor = true;

  void calc() {
    totalgpa = 0;
    totalhour = 0;

    for (int i = 0; i < 10; i++) {
      totalgpa += dg[i];
      totalhour += h[i];
    }
    gpa_resultt = totalgpa / totalhour;
    print("$gpa_resultt");
    print(dg);
    print(h);
    if (gpa_resultt >= 2) {
      mor = true;
    } else {
      mor = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Yor GPA'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20)),
                    width: 400,
                    height: 650,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            flutterrad(1, 'BIOC', 0),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'BIOM', 1),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'BIOP', 2),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'HPHY', 3),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(1, 'SOCI', 4),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'ANAT', 5),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'ENFLISH 101 OR 102', 6),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'HUMAN 101 OR 102', 7),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'ICDL', 8),
                            SizedBox(
                              height: 20,
                            ),
                            flutterrad(3, 'ARABIC 101', 9),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {

                        calc();
                        Flushbar(
                          mainButton: FlatButton(
                            child: Text(
                              'Again !',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          titleText: Text(
                            "Your GPA result is :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white54),
                          ),
                          messageText: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    gpa_resultt.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    mor
                                        ? Icons.emoji_emotions_outlined
                                        : Icons.mood_bad,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Eng: Abdelrahman Swidan",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ).show(context);
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
