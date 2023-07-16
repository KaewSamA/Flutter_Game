import 'package:flutter/material.dart';
import 'package:flutter_project/const.dart';
import 'package:flutter_project/page_hard.dart';
import 'package:flutter_project/page_normal.dart';

class LevelSelect extends StatefulWidget {
  const LevelSelect({Key? key}) : super(key: key);

  @override
  State<LevelSelect> createState() => _LevelSelectState();
}

class _LevelSelectState extends State<LevelSelect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255,54, 57, 63),
    body: Column(
      children: [
       Container(
  height: 300,
  width: 400,
  color: Color.fromARGB(255, 107, 122, 237),
  child: Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'QUIZ MATH',
          style: whiteTextStyleHEAD
        ),
      ),
      Center(
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(0.04), // change the value to adjust the rotation
          child: Icon(
            Icons.calculate,
            size: 90,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
),

          Padding(
            padding: const EdgeInsets.all(70),
            child: SizedBox(
              width: 200.0,
              height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NormalPage()),
                    );
                  },
                child: Text('Normal Mode',style: whiteTextStyleBTN,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 107, 122, 237))),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: 200.0,
              height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HardPage()),
                    );
                  },
                child: Text('Hard Mode',style: whiteTextStyleBTN,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 107, 122, 237))),
                ),
            ),)

      
    ],
      
    ),
    );
  }
}
