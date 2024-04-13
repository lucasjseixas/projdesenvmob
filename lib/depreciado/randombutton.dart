import 'package:flutter/material.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(onPressed: () => {}),
            const SizedBox(
                width: 8), // Add spacing between FloatingActionButton and Text
            Text(text),
          ],
        ),
      ),
    );
  }
}
