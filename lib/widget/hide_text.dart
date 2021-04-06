import 'package:flutter/material.dart';

class HideText extends StatefulWidget {
  @override
  _HideTextState createState() => _HideTextState();
}

class _HideTextState extends State<HideText> {
  // 全文、收起 的状态
  bool mIsExpansion = false;

  // 最大显示行数
  int mMaxLine = 5;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  ///[_text ] 传入的字符串
  Widget _RichText(String _text) {
    if (IsExpansion(_text)) {
      //是否截断
      if (mIsExpansion) {
        return Column(
          children: [
            new Text(
              _text,
              textAlign: TextAlign.left,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                onPressed: () {
                  _isShowText();
                },
                child: Text("收起"),
                textColor: Colors.grey,
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            new Text(
              _text,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                onPressed: () {
                  _isShowText();
                },
                child: Text("全文"),
                textColor: Colors.grey,
              ),
            ),
          ],
        );
      }
    } else {
      return Text(
        _text,
        maxLines: 3,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  bool IsExpansion(String text) {
    TextPainter _textPainter = TextPainter(
        maxLines: 3,
        text: TextSpan(text: text, style: TextStyle(fontSize: 16.0, color: Colors.black)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: 100, minWidth: 50);
    if (_textPainter.didExceedMaxLines) {
      //判断 文本是否需要截断
      return true;
    } else {
      return false;
    }
  }

  void _isShowText() {
    if (mIsExpansion) {
      //关闭
      setState(() {
        mIsExpansion = false;
      });
    } else {
      //打开
      setState(() {
        mIsExpansion = true;
      });
    }
  }
}
