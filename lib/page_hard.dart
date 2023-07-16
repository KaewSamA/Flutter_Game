import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_project/const.dart';
import 'package:flutter_project/utility/button.dart';
import 'package:flutter_project/utility/result_message.dart';

class HardPage extends StatefulWidget {
  const HardPage({Key? key}) : super(key: key);

  @override
  State<HardPage> createState() => _HardPageState();
}

class _HardPageState extends State<HardPage> {
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
  int numberC = 0;
  String operator_1 = " + ";
  String operator_2 = " + ";
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
      } else if (userAnswer.length < 7) {
        userAnswer += button;
      } 
    });
  }

  void checkResult() {
    if (numberA + numberB + numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA + numberB - numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA + numberB * numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA - numberB - numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA - numberB + numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA - numberB * numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA * numberB * numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA * numberB + numberC == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct!',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    }else if (numberA * numberB - numberC == int.parse(userAnswer)) {
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
              message: 'Sorry try again',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
    });

    numberA = randomNumber.nextInt(100)+1;
    numberB = randomNumber.nextInt(100)+1;
    numberC = randomNumber.nextInt(100)+1;
    operator_1 = ['+', '-', '*'][Random().nextInt(3)];
      switch (operator_1) {
        case '+':
          operator_1 = " + ";
          break;
        case '-':
          operator_1 = " - ";
          break;
        case '*':
          operator_1 = " * ";
          break;
      }
      operator_2 = ['+', '-', '*'][Random().nextInt(3)];
      switch (operator_2) {
        case '+':
          operator_2 = " + ";
          break;
        case '-':
          operator_2 = " - ";
          break;
        case '*':
          operator_2 = " * ";
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

          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      numberA.toString() + operator_1.toString() + numberB.toString() + operator_2.toString() + numberC.toString() + ' = ' + ' ? ',
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