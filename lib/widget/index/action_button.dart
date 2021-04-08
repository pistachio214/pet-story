import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final int share;

  final int comments;

  final int like;

  final Function(String, int) callBack;

  ActionButton({@required this.share, @required this.comments, @required this.like, @required this.callBack});

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Color defaultColor = Color.fromRGBO(102, 102, 102, 1.0);

  Color selectedColor = Color.fromRGBO(247, 39, 1, 1.0);

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyleDefault = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      minimumSize: MaterialStateProperty.all(Size(30, 20)),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return Colors.transparent;
        },
      ),
      foregroundColor: MaterialStateProperty.all(
        defaultColor,
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
        selectedColor,
      ),
    );

    List<ButtonStyle> buttonStyle = [
      buttonStyleDefault,
      buttonStyleDefault,
      buttonStyleDefault,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
          icon: Icon(
            Icons.launch,
            size: 14.0,
          ),
          label: widget.share == 0 ? Text('分享') : Text('${widget.share}'),
          onPressed: () {
            setState(() {
              buttonStyle[0] = buttonStyleSelected;
            });
            widget.callBack('share', widget.share + 1);
          },
          style: buttonStyle[0],
        ),
        ElevatedButton.icon(
          icon: Icon(
            Icons.message_outlined,
            size: 14.0,
          ),
          label: widget.comments == 0 ? Text('评论') : Text('${widget.comments}'),
          onPressed: () {
            setState(() {
              defaultColor = selectedColor;
            });
            widget.callBack('comments', widget.comments + 1);
          },
          style: buttonStyle[1],
        ),
        ElevatedButton.icon(
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            size: 14.0,
          ),
          label: widget.like == 0 ? Text('喜欢') : Text('${widget.like}'),
          onPressed: () {
            setState(() {
              defaultColor = selectedColor;
            });
            widget.callBack('like', widget.like + 1);
          },
          style: buttonStyle[2],
        ),
      ],
    );
  }
}
