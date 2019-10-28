import 'package:flutter/material.dart';
import 'package:bmi/pages/splashscreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/':(context)=>Splash(),
    //'/service':(context)=>Service()
  },
));

