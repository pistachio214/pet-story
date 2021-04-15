import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pet_story/widget/index/action_button.dart';
import 'package:pet_story/widget/index/expandable_text.dart';
import 'package:pet_story/widget/index/nine_picture.dart';
import '../../models/articles.dart';

class ArticleInfo extends StatefulWidget {
  final int k;

  final bool showShare;

  ArticleInfo({@required this.k, @required this.showShare});

  @override
  _ArticleInfo createState() => _ArticleInfo();
}

class _ArticleInfo extends State<ArticleInfo> {
  @override
  Widget build(BuildContext context) {
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
                        image: NetworkImage(lists[widget.k].avatar),
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
                            lists[widget.k].nickname,
                            style: TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            changeDate(lists[widget.k].created_at),
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
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              alignment: Alignment.topLeft,
              child: isExpandableText(widget.showShare, lists[widget.k].text_title),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("dynamicDetail", arguments: widget.k);
            },
          ),

          //图片区
          Offstage(
            offstage: lists[widget.k].images.isEmpty ? true : false,
            child: NinePicture(lists[widget.k].images),
          ),
          //视频区 暂不开放此功能(功能不够完善)
          // Offstage(
          //   offstage: lists[index].videos == null ? true : false,
          //   child: VideoScreen(url: lists[index].videos),
          // ),
          // 分割线
          Offstage(
            offstage: widget.showShare,
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.only(right: 5.0),
              child: Divider(
                height: 1.0,
                color: Color.fromRGBO(230, 230, 230, 1.0),
              ),
            ),
          ),
          //转发、评论、点赞
          Offstage(
            offstage: widget.showShare,
            child: Container(
              height: 40.0,
              padding: EdgeInsets.only(top: 5.0),
              child: ActionButton(
                share: lists[widget.k].share_number,
                shareStatus: lists[widget.k].share_status,
                comments: lists[widget.k].comments_number,
                commentsStatus: lists[widget.k].comments_status,
                like: lists[widget.k].like_number,
                likeStatus: lists[widget.k].like_status,
                callBack: (key, num) {
                  setState(() {
                    switch (key) {
                      case 'share':
                        {
                          lists[widget.k].share_number = num;
                          lists[widget.k].share_status = 1;
                        }
                        break;

                      case 'comments':
                        {
                          lists[widget.k].comments_number = num;
                          lists[widget.k].comments_status = 1;
                        }
                        break;

                      case 'like':
                        {
                          lists[widget.k].like_number = num;
                          lists[widget.k].like_status = 1;
                        }
                        break;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget isExpandableText(bool showShare, String content) {
    if (!showShare) {
      return ExpandableText(
        text: content,
        maxLines: 5,
        style: TextStyle(
          fontSize: 18.0,
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),
      );
    }

    return Text(
      content,
      style: TextStyle(
        fontSize: 18.0,
        color: Color.fromRGBO(51, 51, 51, 1.0),
      ),
    );
  }

  String changeDate(int timestamp) {
    //将时间戳转化为日期
    return DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal().toString().substring(0, 16);
  }
}
