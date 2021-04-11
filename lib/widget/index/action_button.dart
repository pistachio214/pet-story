import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final int share;

  final int shareStatus;

  final int comments;

  final int commentsStatus;

  final int like;

  final int likeStatus;

  final Function(String, int) callBack;

  ActionButton(
      {@required this.share,
      @required this.shareStatus,
      @required this.comments,
      @required this.commentsStatus,
      @required this.like,
      @required this.likeStatus,
      @required this.callBack});

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      minimumSize: MaterialStateProperty.all(Size(30, 20)),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return Colors.transparent;
        },
      ),
      foregroundColor: MaterialStateProperty.all(
        Color.fromRGBO(102, 102, 102, 1.0),
      ),
    );

    ButtonStyle buttonStyleSelected = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      minimumSize: MaterialStateProperty.all(Size(30, 20)),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return Colors.transparent;
        },
      ),
      foregroundColor: MaterialStateProperty.all(
        Color.fromRGBO(247, 39, 1, 1.0),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
          icon: Icon(
            Icons.launch,
            size: 14.0,
          ),
          label: widget.share == 0 ? Text('分享') : Text('${widget.share}'),
          onPressed: widget.shareStatus == 0 ? () => _addShare() : null,
          style: widget.shareStatus == 0 ? buttonStyle : buttonStyleSelected,
        ),
        ElevatedButton.icon(
          icon: Icon(
            Icons.message_outlined,
            size: 14.0,
          ),
          label: widget.comments == 0 ? Text('评论') : Text('${widget.comments}'),
          onPressed: widget.commentsStatus == 0 ? () => _addComments() : null,
          style: widget.commentsStatus == 0 ? buttonStyle : buttonStyleSelected,
        ),
        ElevatedButton.icon(
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            size: 14.0,
          ),
          label: widget.like == 0 ? Text('喜欢') : Text('${widget.like}'),
          onPressed: widget.likeStatus == 0 ? () => _addLike() : null,
          style: widget.likeStatus == 0 ? buttonStyle : buttonStyleSelected,
        ),
      ],
    );
  }

  void _addShare() {
    widget.callBack('share', widget.share + 1);
  }

  void _addComments() {
    widget.callBack('comments', widget.comments + 1);
  }

  void _addLike() {
    widget.callBack('like', widget.like + 1);
  }
}
