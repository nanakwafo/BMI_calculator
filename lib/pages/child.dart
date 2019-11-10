import 'package:flutter/material.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:bmi/models/Bmi.dart';
import 'package:bmi/models/Result.dart';
class ChildPage extends StatefulWidget {
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  Result result = new Result();
  BMI bmi = new BMI(0.0,0.0,0.0,0.0,0.0,0.0);

  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  double sliderdefaultvalueHeight = 0.0;
  bool swapheight = false;
  double sliderdefaultvalueWeight = 0.0;
  bool swapweight = false;
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Height:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Slider(
                      divisions: 1,
                      min: 0.0,
                      max: 1.0,
                      value: sliderdefaultvalueHeight,
                      onChanged: (newValue) {
                        if (swapheight == false) {
                          setState(() {
                            swapheight = true;
                            sliderdefaultvalueHeight = newValue;
                          });
                        } else if (swapheight == true) {
                          setState(() {
                            swapheight = false;
                            sliderdefaultvalueHeight = newValue;
                          });
                        }
                      })
                ],
              ),
              ConditionalBuilder(
                  condition: swapheight,
                  builder: (context) {
                    return Form(
                      key: _formkey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'cm:'),
                                onSaved: (cm) {
                                  bmi.set_cm = double.parse(cm);
                                },
                              )),
                          SizedBox(width: 15.0),
                        ],
                      ),
                    );
                  },
                  fallback: (context) {
                    return Form(
                      key: _formkey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Feet:'),
                                onSaved: (feet) {
                                  bmi.set_feet = double.parse(feet);
                                },
                              )),
                          SizedBox(width: 15.0),
                          Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Inche:'),
                                onSaved: (inche) {
                                  bmi.set_inche = double.parse(inche);
                                },
                              ))
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 30.0,
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Weight:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Slider(
                      divisions: 1,
                      min: 0.0,
                      max: 1.0,
                      value: sliderdefaultvalueWeight,
                      onChanged: (newValue) {
                        if (swapweight == false) {
                          setState(() {
                            swapweight = true;
                            sliderdefaultvalueWeight = newValue;
                          });
                        } else if (swapweight == true) {
                          setState(() {
                            swapweight = false;
                            sliderdefaultvalueWeight = newValue;
                          });
                        }
                      })
                ],
              ),
              ConditionalBuilder(
                  condition: swapweight,
                  builder: (context) {
                    return Form(
                      key: _formkey2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Kg:'),
                                onSaved: (kg) {
                                  bmi.set_kg = double.parse(kg);
                                },
                              )),
                        ],
                      ),
                    );
                  },
                  fallback: (context) {
                    return Form(
                      key: _formkey2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Stone:'),
                                onSaved: (stone) {
                                  bmi.set_stone = double.parse(stone);
                                },
                              )),
                          SizedBox(width: 15.0),
                          Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Pounds:'),
                                onSaved: (pounds) {
                                  bmi.set_pounds = double.parse(pounds);
                                },
                              ))
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 30.0,
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                _formkey.currentState.save();
                _formkey2.currentState.save();
                BMI(bmi.inche, bmi.feet, bmi.cm, bmi.kg, bmi.pounds, bmi.stone);
                result.displayresults(context, bmi);
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
//                                    side: BorderSide(color: Colors.red)
              ),
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
