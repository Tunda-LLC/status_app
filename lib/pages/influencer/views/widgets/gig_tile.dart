import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/pages/influencer/views/gig/gig.dart';

class GigTile extends StatefulWidget {
  const GigTile({
    Key? key,
    this.status = 0,
    required this.v16,
  }) : super(key: key);

  final double v16;
  final int status;

  @override
  _GigTileState createState() => _GigTileState();
}

class _GigTileState extends State<GigTile> {
  late Color _bgColor, _signColor, _textColor;
  @override
  void initState() {
    super.initState();
    _bgColor = widget.status == 0
        ? APP_BLACK
        : widget.status == 1
            ? APP_PRIMARY
            : widget.status == 2
                ? APP_GREEN
                : APP_GOLD;

    _signColor = widget.status == 0
        ? Color(0xff818181)
        : widget.status == 1
            ? REAL_WHITE
            : widget.status == 2
                ? REAL_WHITE
                : REAL_WHITE;

    _textColor = widget.status == 0
        ? APP_BLACK
        : widget.status == 1
            ? APP_PRIMARY
            : widget.status == 2
                ? APP_GREEN
                : APP_GOLD;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => Gig())),
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Material(
          elevation: 2.8,
          child: Container(
            padding: EdgeInsets.all(widget.v16 / 4),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(
                      vertical: widget.v16 / 3, horizontal: widget.v16 / 1.8),
                  color: _bgColor,
                  child: Text(
                    "#",
                    style: TextStyle(fontSize: 40, color: _signColor),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Kattoke's ads ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle.copyWith(color: _textColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
