import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 九宫格
 */
class NinePicture extends StatelessWidget {
  List list = [];

  NinePicture(List list) {
    this.list = list;
  }

  void showPhoto(BuildContext context, String img) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) {
      return GestureDetector(
        child: SizedBox.expand(
          child: Hero(
            tag: img,
            child: Image.network(
              img,
              fit: BoxFit.contain,
            ),
          ),
        ),
        onTap: () {
          Navigator.maybePop(context);
        },
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return SizedBox();
    }

    int _crossAxisCount = 1;

    if (list.length == 1) {
      _crossAxisCount = 1;
    } else if (list.length == 2) {
      _crossAxisCount = 2;
    } else {
      _crossAxisCount = 3;
    }
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.width / _crossAxisCount + 2.0) * (list.length / _crossAxisCount).ceil(),
      child: GridView.count(
        physics: ClampingScrollPhysics(),
        crossAxisCount: _crossAxisCount,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        padding: const EdgeInsets.all(4.0),
        children: list.map(
          (img) {
            //解决在子树中有多个Hero 对象共用了一个tag，每个Hero对象的tag必须是惟一的
            String tag = Random().nextInt(100000000).toString();
            return GestureDetector(
              onTap: () {
                showPhoto(context, img);
              },
              child: Hero(
                tag: tag,
                child: ClipRRect(
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                  //取消图片圆角
                  // borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
