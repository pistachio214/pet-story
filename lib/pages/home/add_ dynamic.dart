import 'package:flutter/material.dart';

import '../../widget/index/add_dynamic_images.dart';

class AddDyNamic extends StatefulWidget {
  @override
  _AddDyNamicState createState() => _AddDyNamicState();
}

class _AddDyNamicState extends State<AddDyNamic> {
  TextEditingController _contentController = TextEditingController();

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
              overlayColor: MaterialStateProperty.all(Colors.transparent), //去掉水波纹
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  return activeColor;
                },
              ),
            ),
            onPressed: () {
              String content = _contentController.text;
              print(content);
            },
          )
        ],
      ),
      body: Column(
        children: [
          //内容填充区
          Container(
            padding: EdgeInsets.all(5.0),
            child: TextField(
              controller: _contentController,
              maxLines: 10,
              maxLength: 5000,
              decoration: InputDecoration(
                hintText: '分享一点东西吧!',
                enabledBorder: UnderlineInputBorder(
                  //未选中时候的颜色
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  //选中时外边框颜色
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              onChanged: (value) {
                print('改变了');
              },
            ),
          ),

          //图片选择区
          Container(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: DynamicImages(),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false, //键盘弹起防止被遮挡
    );
  }
}
