import 'package:covid19/animation/bottomAnimation.dart';
import 'package:covid19/controller/covidAPI.dart';
import 'package:covid19/customWidgets/customLoader.dart';
import 'package:covid19/customWidgets/homeTile.dart';
import 'package:covid19/model/homeCountryDataModel.dart';
import 'package:flutter/material.dart';

class Turkiye extends StatefulWidget {
  @override
  _TurkiyeState createState() => _TurkiyeState();
}

class _TurkiyeState extends State<Turkiye> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Flag(),
              FutureBuilder<HomeStats>(
                future: CovidAPI().getHomeCase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: height * 0.4155,
                      child: Center(
                        child: VirusLoader(),
                      ),
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Son Güncelleme: ${snapshot.data.latestUpdated.substring(0, 10)}\t${snapshot.data.latestUpdated.substring(11, 19)}",
                              style: TextStyle(
                                  fontFamily: 'MyFont',
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Icon(Icons.refresh))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.cases,
                                infoHeader: 'Toplam Vaka',
                                tileColor: Colors.blueAccent,
                              ),
                            ),
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.recovered,
                                infoHeader: 'Toplam İyileşen',
                                tileColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.deaths,
                                infoHeader: 'Toplam Ölüm',
                                tileColor: Colors.redAccent,
                              ),
                            ),
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.tested,
                                infoHeader: 'Toplam Test',
                                tileColor: Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.dailyCases,
                                infoHeader: 'Günlük Vaka',
                                tileColor: Colors.black,
                              ),
                            ),
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.dailyRecovered,
                                infoHeader: 'Günlük İyileşen',
                                tileColor: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.dailyDeaths,
                                infoHeader: 'Günlük Ölüm',
                                tileColor: Colors.purpleAccent,
                              ),
                            ),
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.dailyTested,
                                infoHeader: 'Günlük Test',
                                tileColor: Colors.deepOrangeAccent,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          "Evinde kal, Ülkeni koru!",
                          style: TextStyle(
                              fontFamily: 'MyFont',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Flag extends StatelessWidget {
  String emoji() {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = "TR";

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "${emoji()}",
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1),
        ),
        Text(
          "Türkiye",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: MediaQuery.of(context).size.height * 0.05),
        ),
      ],
    );
  }
}
