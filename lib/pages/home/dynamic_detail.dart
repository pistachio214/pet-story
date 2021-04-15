import 'package:flutter/material.dart';
import 'package:pet_story/widget/index/article_info.dart';

class DynamicDetail extends StatefulWidget {
  @override
  _DynamicDetailState createState() => _DynamicDetailState();
}

class _DynamicDetailState extends State<DynamicDetail> {
  @override
  Widget build(BuildContext context) {
    var key = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        centerTitle: true,
        title: Text('动态正文'),
        leading: BackButton(),
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('images/home/sync.png'),
            ),
            onPressed: () {
              print('刷新界面');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //内容区域
            ArticleInfo(
              k: key,
              showShare: true,
            ),

            //评论区域
            Container(
              margin: EdgeInsets.only(top: 15.0),
              height: 1000.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
              child: Text('121212'),
            )
          ],
        ),
      ),
    );
  }
}
