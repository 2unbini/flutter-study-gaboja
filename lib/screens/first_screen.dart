import 'package:flutter/material.dart';
import 'package:first_project/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  int count = 0;
  bool canPlusButtonBePressed = true;
  bool canMinusButtonBePressed = true;

  Future nextButtonPressed(BuildContext context) {
    // Do something when next button pressed...

    return Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => SecondScreen(
            screenData: count,
          ),
      ),
    );
  }

  void plusButtonPressed() {
    // + button pressed..
    increaseCount();
  }

  void increaseCount() {
    // setState를 통해서만 상태 변경 가능!
    // setState 블록 안에 코드를 밖으로 빼면 UI는 변하지 않고, count 값만 변함
    setState(() {
      count += 1;
      if (count == 10) {
        canPlusButtonBePressed = false;
      } else {
        canMinusButtonBePressed = true;
      }
    });
  }

  void minusButtonPressed() {
    // - button pressed..
    decreaseCount();
  }

  void decreaseCount() {
    setState(() {
      count -= 1;
      if (count == -10) {
        canMinusButtonBePressed = false;
      } else {
        canPlusButtonBePressed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap from -10 to 10'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'count: $count',
              style: const TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: canMinusButtonBePressed ? minusButtonPressed : null,
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: canPlusButtonBePressed ? plusButtonPressed : null,
                  child: const Text('+'),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () => nextButtonPressed(context),
                child: const Text('Did you made 10?')
            )
          ],
        ),
      ),
    );
  }
}