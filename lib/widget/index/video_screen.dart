import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  final String url;

  VideoScreen({@required this.url});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    if (widget.url != null) {
      player.setDataSource(widget.url, autoPlay: false);
    } else {
      print(widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url == null) {
      return SizedBox();
    }

    return Container(
      height: 295.0,
      width: 333.0,
      alignment: Alignment.center,
      child: FijkView(
        player: player,
      ),
    );
  }
}
