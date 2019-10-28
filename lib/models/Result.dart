import 'package:flutter/material.dart';
import 'package:bmi/models/Bmi.dart';

class Result {
  String resultsMeaning = 'Overweight';
  double computedbmiValue;
//  BMI provides an indication of your health status. The BMI categories are:
////
////  Underweight = BMI<18.5
////
////  Normal weight = BMI 18.5–24.9
////
////  Overweight = BMI 25–29.9
////
////  Obesity = BMI of 30 or above
  double controller(BMI bmiValue){
    return null;
  }
  displayresults(BuildContext context, BMI bmiValue) {
    computedbmiValue=controller(bmiValue);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Center(
                  child: Text(
                'Your BMI index:',
                style: TextStyle(fontSize: 30.0),
              )),
              Card(
                  child: Center(
                      child: Text(
                '${bmiValue.stone}',
                style: TextStyle(fontSize: 60.0),
              ))),
              Center(
                  child: Text(
                'What this means:',
                style: TextStyle(fontSize: 30.0),
              )),
              Flexible(
                  child: Card(
                      child: Center(
                          child: Text(
                '$resultsMeaning',
                style: TextStyle(fontSize: 60.0),
              )))),
            ],
          );
        });
  }
}
