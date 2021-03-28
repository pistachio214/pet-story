import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  // 构造方法及属性声明部分
  const HomeBottomNavigationBar(
    this.bottomTabs,
    this.onTapHander,
  );

  final Function(int) onTapHander;
  final List<BottomNavigationBarItem> bottomTabs;

  @override
  _HomeBottomNavigationBarState createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //设置类型(一旦超过4个bar,type会变化.所以最好设置一下)
      type: BottomNavigationBarType.fixed,
      //设置bar激活时的颜色
      fixedColor: Colors.black,
      //该值为选中情况的key
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onTapHander(index);
      },
      //选中时文字大小
      selectedFontSize: 12.0,
      //未选中时文字大小
      unselectedFontSize: 10.0,
      items: widget.bottomTabs,
    );
  }
}
