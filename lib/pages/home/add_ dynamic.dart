import 'package:flutter/material.dart';

class AddDyNamic extends StatefulWidget {
  @override
  _AddDyNamicState createState() => _AddDyNamicState();
}

class _AddDyNamicState extends State<AddDyNamic> {
  final Color activeColor = Color.fromRGBO(51, 51, 51, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        centerTitle: true,
        title: Text('发表动态'),
        leading: BackButton(),
        actions: [
          TextButton(
            child: Text('发布'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(10, 10)),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  return activeColor;
                },
              ),
            ),
            onPressed: () {
              print('发表动态');
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: Text('内容'),
      ),
    );
  }
}
