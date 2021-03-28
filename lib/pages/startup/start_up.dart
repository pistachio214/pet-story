import 'dart:async';

import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  //声明记时器变量
  Timer _timer;

  //记录当前时间
  int _start_seconds = 3;

  @override
  void initState() {
    super.initState();

    //间隔一秒，循环执行
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      //自减
      _start_seconds--;
      if (_start_seconds == 0) {
        _timer.cancel();
        Navigator.pushNamed(context, "home");
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 取消定时器
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 80, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('跳过启动 ${_start_seconds} 秒'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
                          //获取焦点时的颜色
                          return Colors.grey;
                        } else if (states.contains(MaterialState.pressed)) {
                          //按下时的颜色
                          return Colors.grey;
                        }
                        //默认状态使用灰色
                        return Colors.grey;
                      },
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey[200];
                      }
                      //默认不使用背景颜色
                      return Colors.grey[300];
                    }),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "home");
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100),
            child: Image(
              image: AssetImage('images/startup/logo.png'),
              width: 155,
              height: 155,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomRight,
              child: Image(
                image: AssetImage('images/startup/pet_story.png'),
                width: 300,
                height: 153,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
