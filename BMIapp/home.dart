import 'package:flutter/material.dart';
import 'left_bar.dart';
import 'right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightContoller = TextEditingController();
  TextEditingController _weightContoller = TextEditingController();
  double _bmiresult = 0.0;
  String _textresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        // elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black12 ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  child: TextField(
                    controller: _heightContoller,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height',
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        )),
                  ),
                ),
                Container(
                  width: 140,
                  child: TextField(
                    controller: _weightContoller,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightContoller.text);
                double _w = double.parse(_weightContoller.text);
                setState(() {
                  _bmiresult = _w / (_h * _h);
                  if (_bmiresult > 25) {
                    _textresult = 'You are Overweight';
                  } else if (_bmiresult <= 25 && _bmiresult >= 18.5) {
                    _textresult = 'You have Normal Weight';
                  } else {
                    _textresult = 'You are Underweight';
                  }
                });
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                _bmiresult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: Colors.yellow),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _textresult.isNotEmpty,
              child: Container(
                child: Text(
                  _textresult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellow),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RightBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 40,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 40,
            ),
            RightBar(barWidth: 40),
            SizedBox(
              height: 40,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 40,
            ),
            LeftBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}