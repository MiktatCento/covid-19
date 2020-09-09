import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class AdTileHome extends StatelessWidget {
  final Color tileColor;
  final String assetImage;
  final String adNativeStr;
  AdTileHome({
    this.tileColor,
    this.assetImage,
    this.adNativeStr,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: tileColor,
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.04),
          width: width,
          height: height * 0.14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: NativeAdmob(
                  adUnitID: adNativeStr,
                  type: NativeAdmobType.full,
                ),
              ),
              Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "$assetImage",
                    height: height * 0.1,
                  )),
            ],
          )),
    );
  }
}
