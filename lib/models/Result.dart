import 'package:flutter/material.dart';
import 'package:bmi/models/Bmi.dart';
import 'dart:math';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Result {
  String resultsMeaning = 'Overweight';
    String computedbmiValue;

//  BMI provides an indication of your health status. The BMI categories are:
////
////  Underweight = BMI<18.5
////
////  Normal weight = BMI 18.5–24.9
////
////  Overweight = BMI 25–29.9
////
////  Obesity = BMI of 30 or above
  double controller(BMI bmiValue) {
    double kg = bmiValue.kg;
    double feet = bmiValue.feet;
    double inche = bmiValue.inche;
    double stone = bmiValue.stone;
    double pounds = bmiValue.pounds;
    double cm = bmiValue.cm;

    if (cm == 0.0) {
      cm = feet * 30.48 + inche * 2.54;
    }

    if (kg == 0.0) {
      kg = stone * 6.35029 + pounds * 0.453592;
    }
    return kg / pow(cm * 0.01, 2);
  }
  String getBmiStatus( double  computedbmiValue){

    if(computedbmiValue < 18.5){return 'Underweight';}
    if(computedbmiValue > 18.5 && computedbmiValue < 24.9){return 'Normal weight';}
    if(computedbmiValue > 25 && computedbmiValue < 29.9){return 'Overweight';}
    if(computedbmiValue > 30.0 ){return 'Obese';}

  }

  displayresults(BuildContext context, BMI bmiValue) {
    computedbmiValue = controller(bmiValue).toStringAsFixed(1);

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  'Your BMI index: $computedbmiValue',
                  style: TextStyle(fontSize: 15.0),
                )),

                Container(
                    child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(minimum: 0, maximum: 150,
                              ranges: <GaugeRange>[
                                GaugeRange(startValue: 0, endValue: 18.5, color:Colors.green),
                                GaugeRange(startValue: 18.5,endValue: 24.9,color: Colors.orange),
                                GaugeRange(startValue: 24.9,endValue: 29.9,color: Colors.red),
                                GaugeRange(startValue: 29.9,endValue: 150,color: Colors.blue),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value:  double.parse(computedbmiValue), enableAnimation: true,animationType: AnimationType.slowMiddle)],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(widget: Container(child:
                                Text('$computedbmiValue',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                                    angle: 90, positionFactor: 0.5
                                )]
                          )])
                ),
                Center(
                    child: Text(
                      '${getBmiStatus(double.parse(computedbmiValue))}',
                      style: TextStyle(fontSize: 15.0),
                    )),
              ],
            ),
          );
        });
  }
}
