import 'package:flutter/material.dart';
import 'package:untitled/text_screen.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () async {
                  listx.add(controller.text);

                  print(listx);
                  Navigator.pop(context);
                },
                child: Text('ADD'))
          ],
        ),
      ),
    );
  }
}
