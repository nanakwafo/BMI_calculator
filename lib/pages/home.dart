import 'package:flutter/material.dart';
import 'package:bmi/pages/calculator.dart';
import 'package:bmi/pages/information.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar: AppBar(
            centerTitle: true,
            title: Text('BMI'),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 10.0,
              tabs: [
                Tab(icon: Icon(Icons.dialpad)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
          ),
          body: TabBarView(
            children: [CalculatorPage(), InformationPage()],
          ),
        ));
  }
}

