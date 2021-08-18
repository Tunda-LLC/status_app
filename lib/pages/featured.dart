import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:transparent_image/transparent_image.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Featured",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(children: <Widget>[
          Container(
            height: height,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 8,
              padding: EdgeInsets.only(
                  left: 4, right: 4, top: v16, bottom: height / 3),
              itemBuilder: (BuildContext context, int index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: APP_GREY,
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CustomNetworkImage(testImage2, cover: true),
                        ),
                      ),
                    ],
                  )),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
          )
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
