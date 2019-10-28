import 'package:flutter/material.dart';
import 'package:bmi/pages/adult.dart';
import 'package:bmi/pages/child.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: Text('Calculator'),
              bottom: TabBar(
                tabs: [
                  Text(
                    "Adult",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "Child",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [AdultPage(), ChildPage()]),
          )),
    );
  }
}
