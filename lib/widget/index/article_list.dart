import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_story/widget/index/action_button.dart';
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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      child: Column(
        children: [
          //头像、昵称
          Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      border: Border.all(
                        color: Colors.red[100],
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(lists[index].avatar),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(minWidth: 100),
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            lists[index].nickname,
                            style: TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            changeDate(lists[index].created_at),
                            style: TextStyle(
                              color: Color.fromRGBO(153, 153, 153, 1.0),
                              fontSize: 11.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          //文字描述
          Container(
            margin: EdgeInsets.only(top: 8.0),
            alignment: Alignment.topLeft,
            child: ExpandableText(
              text: '${lists[index].text_title}',
              maxLines: 5,
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromRGBO(51, 51, 51, 1.0),
              ),
            ),
          ),
          //图片区
          Offstage(
            offstage: lists[index].images.isEmpty ? true : false,
            child: NinePicture(lists[index].images),
          ),
          //视频区 暂不开放此功能(功能不够完善)
          // Offstage(
          //   offstage: lists[index].videos == null ? true : false,
          //   child: VideoScreen(url: lists[index].videos),
          // ),
          // 分割线
          Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(right: 5.0),
            child: Divider(
              height: 1.0,
              color: Color.fromRGBO(230, 230, 230, 1.0),
            ),
          ),
          //转发、评论、点赞
          Container(
            height: 40.0,
            padding: EdgeInsets.only(top: 5.0),
            child: ActionButton(
              share: lists[index].share_number,
              comments: lists[index].comments_number,
              like: lists[index].like_number,
              callBack: (key, num) {
                setState(() {
                  switch (key) {
                    case 'share':
                      {
                        lists[index].share_number = num;
                      }
                      break;

                    case 'comments':
                      {
                        lists[index].comments_number = num;
                      }
                      break;

                    case 'like':
                      {
                        lists[index].like_number = num;
                      }
                      break;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  String changeDate(int timestamp) {
    //将时间戳转化为日期
    return DateTime.fromMillisecondsSinceEpoch(timestamp)
        .toLocal()
        .toString()
        .substring(0, 16);
  }
}
