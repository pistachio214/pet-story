import 'package:flutter/material.dart';

class AddDyNamic extends StatefulWidget {
  @override
  _AddDyNamicState createState() => _AddDyNamicState();
}

class _AddDyNamicState extends State<AddDyNamic> {
  TextEditingController contentController = TextEditingController();

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
              String content = contentController.text;
              print(content);
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: '输入内容',
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0)),
          ),
          autofocus: false,
          controller: contentController,
          cursorColor: Colors.black, //光标颜色
          maxLength: 500,
          minLines: 10,
          maxLines: 10,
        ),
      ),
    );
  }
}
