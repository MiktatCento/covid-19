import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:covid19/views/dashboard.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
  FirebaseAdMob.instance.initialize(
    appId: "ca-app-pub-1921914374902301~2243787363",
  );

  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: "ca-app-pub-1921914374902301/8343944247",
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );
  myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.yellow[700],
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.orangeAccent,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: SplashScreen(
        seconds: 2,
        imageBackground: AssetImage('images/covidNew.png'),
        loadingText: Text('Evinde kal, güvende kal!',
            style:
                TextStyle(fontFamily: 'MyFont', fontWeight: FontWeight.bold)),
        loaderColor: Colors.orange,
        navigateAfterSeconds: Dashboard(),
      ),
    );
  }
}
