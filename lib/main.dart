import 'package:flutter/material.dart';
import 'package:untitled4/result_page.dart';

void main() {
  runApp(const MyApp());
}

// command stl
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI Calculator',
        theme: ThemeData.dark(),
        home: const LandingPage());
    return const Placeholder();
  }
}

enum Gender { male, female, other }

// command STF
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _height = 100.00;
  double _weight = 56.04;
  int _Age = 18;
  double bmi = 0.0;
  Gender gender = Gender.other;
  int counter1 = 0, counter2 = 0;
  void increment1() {
    setState(() {
      _weight++;
    });
  }

  void increment2() {
    setState(() {
      _Age++;
    });
  }

  void decrement1() {
    setState(() {
      _weight--;
    });
  }

  void decrement2() {
    setState(() {
      _Age--;
    });
  }

  void calculateBMI() {
    setState(() {
      double heightM = _height / 100;
      bmi = _weight / (heightM * heightM);
      print('BMI Value:$bmi');
    });
  }

  @override
  Widget build(BuildContext context) {
    //var style;
    return Scaffold(
      // screen  page
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                //male
                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  child: Card(
                    color: gender == Gender.male ? Colors.blue : Colors.grey,
                    child: Column(
                      children: const [
                        Icon(Icons.male),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34),
                        )
                      ],
                    ),
                  ),
                )),

                Expanded(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  child: Card(
                    color: gender == Gender.female ? Colors.blue : Colors.grey,
                    child: Column(
                      children: const [
                        Icon(Icons.female),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Container(
              child: Card(
                  child: Column(
                children: [
                  const Text('Height'),
                  Text('${_height.toStringAsFixed(0)} cm',
                      style: TextStyle(fontWeight: FontWeight.bold,)),
                  Slider(
                    value:_height,
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                    min: 100,
                    max: 200,
                  ),
                ],
              )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Card(
                      child: Column(
                        children: [
                          Text('Weight'),
                          Text('${_weight.toStringAsFixed(0)} kg'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: increment1,
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: decrement1,
                                  child: Icon(Icons.remove),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Age
                Expanded(
                  child: Container(
                    child: Card(
                      child: Column(
                        children: [
                          Text('Age'),
                          Text('${_Age.toStringAsFixed(0)} cm'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: increment2,
                                  child: Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  )),
                              ElevatedButton(
                                  onPressed: decrement2,
                                  child: Icon(Icons.remove),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              result: bmi.toStringAsFixed(0),
                            )));
              },
              child: const Text('Calculator'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
