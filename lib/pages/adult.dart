import 'package:bmi/models/Bmi.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:bmi/models/Result.dart';

class AdultPage extends StatefulWidget {
  @override
  _AdultPageState createState() => _AdultPageState();
}

class _AdultPageState extends State<AdultPage> {
  Result result = new Result();
  BMI bmi = new BMI(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

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
                              bmi.set_cm =
                                  cm.isEmpty ? bmi.cm : double.parse(cm);
                            },
                            validator: (cm) {
                              if (cm.isEmpty) {
                                return 'field required';
                              } else {
                                return null;
                              }
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
                              bmi.set_feet =
                                  feet.isEmpty ? bmi.feet : double.parse(feet);
                            },
                            validator: (feet) {
                              if (feet.isEmpty) {
                                return 'field required';
                              } else {
                                return null;
                              }
                            },
                          )),
                          SizedBox(width: 15.0),
                          Flexible(
                              child: TextFormField(
                            decoration: InputDecoration(labelText: 'Inche:'),
                            onSaved: (inche) {
                              bmi.set_inche = inche.isEmpty
                                  ? bmi.inche
                                  : double.parse(inche);
                            },
                            validator: (inche) {
                              if (inche.isEmpty) {
                                return 'field required';
                              } else {
                                return null;
                              }
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
                              bmi.set_kg =
                                  kg.isEmpty ? bmi.kg : double.parse(kg);
                            },
                            validator: (kg) {
                              if (kg.isEmpty) {
                                return 'field required';
                              } else {
                                return null;
                              }
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
                              bmi.set_stone = stone.isEmpty
                                  ? bmi.stone
                                  : double.parse(stone);
                            },
                            validator: (stone) {
                              if (stone.isEmpty) {
                                return 'field required';
                              } else {
                                return null;
                              }
                            },
                          )),
                          SizedBox(width: 15.0),
                          Flexible(
                              child: TextFormField(
                            decoration: InputDecoration(labelText: 'Pounds:'),
                            onSaved: (pounds) {
                              bmi.set_pounds = pounds.isEmpty
                                  ? bmi.pounds
                                  : double.parse(pounds);
                            },
                            validator: (pounds) {
                              if (pounds.isEmpty) {
                                return 'field required';
                              } else {
                                return null;
                              }
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
              onPressed : () {
               bool form1 = _formkey.currentState.validate();
               bool form2 = _formkey2.currentState.validate();
               if(form1 && form2 ==true){
                 _formkey.currentState.save();
                  _formkey2.currentState.save();
                  BMI(bmi.inche, bmi.feet, bmi.cm, bmi.kg, bmi.pounds,
                      bmi.stone);
                  result.displayresults(context, bmi);
               }

              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
//                                    side: BorderSide(color: Colors.red)
              ),
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 15.0,
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
