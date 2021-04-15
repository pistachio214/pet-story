import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_story/widget/index/action_button.dart';
import 'package:pet_story/widget/index/article_info.dart';
import 'package:pet_story/widget/index/expandable_text.dart';
import 'package:pet_story/widget/index/nine_picture.dart';

// import 'package:pet_story/widget/index/video_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import './../../models/articles.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    print('下拉刷新');
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    // setState(() {

    // });

    print('上拉刷新');
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("上拉加载");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("加载失败！点击重试！");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("松手,加载更多!");
              } else {
                body = Text("没有更多数据了!");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemCount: lists.length,
            itemBuilder: _listItemBuilder,
          )),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return ArticleInfo(
      k: index,
      showShare: false,
    );
  }
}
