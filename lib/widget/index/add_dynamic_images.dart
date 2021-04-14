import 'package:flutter/material.dart';

class DynamicImages extends StatefulWidget {
  @override
  _DynamicImagesState createState() => _DynamicImagesState();
}

class _DynamicImagesState extends State<DynamicImages> {
  List<Widget> list;

  @override
  void initState() {
    list = []..add(buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 得到屏幕的宽高
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Center(
          // 设置透明度
          child: Opacity(
            opacity: 0.8,
            child: Container(
              width: _width,
              height: _height / 2,
              color: Colors.transparent,
              child: Wrap(
                children: list,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    // 手势识别的组件
    return GestureDetector(
      onTap: () {
        // 如果list 的长度小于10长度就添加照片 (最多9张)
        if (list.length < 10) {
          // 更新界面
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        // 添加照片的组件
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  // 显示照片的组件
  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        // color: Colors.yellow,
        child: Center(
          child: Image.network(
            'https://pics0.baidu.com/feed/a686c9177f3e6709665d2ed0c933213bf9dc55bf.jpeg?token=c923a2fa85ba4a5283ebede1db712492',
          ),
        ),
      ),
    );
  }
}
