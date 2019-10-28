import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:bmi/pages/home.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: Home(),
      title: Text('Ultimate BMI Assistant',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
     // image: Image.asset('images/logo.jpg'),
      backgroundColor: Colors.blue,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 60.0,
      loaderColor: Colors.white
    );
  }
}

