import 'package:flutter/material.dart';
import 'package:untitled/add.dart';

List listx = [1, 2, 3];

class TextScreen extends StatefulWidget {
  TextScreen({Key? key}) : super(key: key);

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Add(),
            ),
          );

          setState(() {});
        },
      ),
      body: ListView.builder(
        itemCount: listx.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(listx[index].toString()),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String name;
  final Function fun;
  const NewWidget({
    Key? key,
    required this.name,
    required this.fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Click  Me'),
      onPressed: () {
        fun();
        print('call');
      },
    );
  }
}
