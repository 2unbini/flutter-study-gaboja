import 'package:flutter/material.dart';
import 'package:first_project/screens/first_screen.dart';

class SecondScreen extends StatelessWidget {

  final int screenData;

  SecondScreen({ required this.screenData });

  void previousButtonPressed(BuildContext context) {
    // Do something when previous button pressed...
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            screenData == 10
                ? Image.network('https://common.hanmi.co.kr/upfile/ces/product/p_2011_tenten_p_400.jpg')
                : const Text('No, it\'s'),
            Text(
              '"$screenData!"',
              style:
              screenData == 10
                  ? const TextStyle(
                  fontSize: 50,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold
              )
                  : const TextStyle(
                  fontSize: 50,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.normal
              )
            ),
            OutlinedButton(
                onPressed: () => previousButtonPressed(context),
                child: const Text('Previous Button')
            )
          ],
        ),
      ),
    );
  }
}