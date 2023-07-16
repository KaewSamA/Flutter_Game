import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_project/const.dart';
import 'package:flutter_project/utility/button.dart';
import 'package:flutter_project/utility/result_message.dart';

class NormalPage extends StatefulWidget {
  const NormalPage({Key? key}) : super(key: key);

  @override
  State<NormalPage> createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '-',
  ];

  int numberA = 0;
  int numberB = 0;
  String operator = " + ";
  String userAnswer = '';


  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 4) {
        userAnswer += button;
      } 
    });
  }

  //ตรวจว่าถูกหรือไม่ถูก
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } 
    else if (numberA - numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA * numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }
    else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Wrong! Try again.',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  //สุ่มเลข
  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();

    //รีค่า
    setState(() {
      userAnswer = '';
    });

    // create a new question
    numberA = randomNumber.nextInt(10)+1;
    numberB = randomNumber.nextInt(10)+1;
    operator = ['+', '-', '*'][Random().nextInt(3)];
      switch (operator) {
        case '+':
          operator = " + ";
          break;
        case '-':
          operator = " - ";
          break;
        case '*':
          operator = " * ";
          break;
      }
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 57, 63),
      body: Column(
        children: [

          Container(
            height: 100,
            color: Color.fromARGB(255, 107, 122, 237),
          ),

          //คำถาม
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // question
                    Text(
                      numberA.toString() + operator.toString() + numberB.toString() + ' = ' + ' ? ',
                      style: whiteTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 107, 122, 237),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    ),

          //ปุ่มตัวเลข
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}