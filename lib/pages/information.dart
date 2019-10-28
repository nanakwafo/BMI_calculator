import 'package:flutter/material.dart';
class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('What is BMI and how does it work?'),
                    subtitle: Text('BMI is an acronym for the term body mass index. It’s a measurement of a person’s body weight in relation to their height for all adults, irrespective of age and sex.In 1985 the National Institutes of Health (NIH) recommended that physicians adopt the BMI as an index of obesity. It has now become the standard formula to determine what is a healthy weight, underweight, overweight and obese. These weight categories are used to help assess a person’s risk of obesity related diseases.'),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('How is BMI used?'),
                    subtitle: Text('BMI is a proxy measure of excess body fat. Doctors use BMI as a screening tool to signpost a person’s weight category. A person with a high BMI indicates they may have high body fatness and an overweight or obese weight status with an increased risk of obesity related illnesses. BMI is not a diagnostic tool of an individual’s body fatness or health so further tests are required.BMI is the most commonly used measure for monitoring the prevalence of overweight and obesity at population level.'),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Why use BMI?'),
                    subtitle: Text('BMI is an easy and non-invasive method of accurately and consistently assessing excess body fat at a population level. Excess body fat is linked to a person’s current and future morbidity. True measures of BMI are expensive or impractical and other proxy measures are more difficult to measure precisely.BMI population data has been compiled on a worldwide scale.'),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Limitations of BMI'),
                    subtitle: Text('BMI has limitations. It may not be an accurate tool for assessing weight status at an individual level as it does not take into account a person’s fitness and muscle mass, their ethnic origin, body shape, age and sex. It also doesn’t provide an indication of body fat distribution.'),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
