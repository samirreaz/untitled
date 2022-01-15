import 'dart:math';

import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  TransformScreen({Key? key}) : super(key: key);

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  double i = 0;

  change() {
    i = Random().nextDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 +
                  200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue[600],
            alignment: Alignment.center,
            child: Text('Hello World',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(i),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                change();
              });
            },
            child: Text('Change'),
          ),
        ],
      ),
    );
  }
}
