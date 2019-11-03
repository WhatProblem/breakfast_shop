import 'package:flutter/material.dart';
import '../../config/network_image.dart';
import '../../mock/mock.dart';
import '../../icons/icons.dart';

class SortPage extends StatelessWidget {
  final Color primaryColor = Colors.orange[300];
  final Color indicatorColor = Colors.white;
  final Color labelColor = Colors.white;
  final Color bgColor = Colors.orange[300];
  final Color secondaryColor = Color(0xff324558);
  final List<Map> goods = data['goods'];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 10,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: primaryColor,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(color: secondaryColor),
          ),
        ),
        child: Scaffold(
          key: _key,
          backgroundColor: Theme.of(context).buttonColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '早餐分类',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // leading: Icon(Icons.category),
            automaticallyImplyLeading: false, // 防止drawer弹出左侧有返回按钮
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.white),
                onPressed: () {
                  print('点击筛选');
                  // _key.currentState.openDrawer();
                  _key.currentState.openEndDrawer();
                },
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: labelColor,
              indicatorColor: indicatorColor,
              unselectedLabelColor: secondaryColor,
              tabs: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.milk, color: Colors.white),
                      Text('牛奶')
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.mianbao, color: Colors.white),
                      Text('面包'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.xiaolongbao, color: Colors.white),
                      Text('小笼包'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.tang, color: Colors.white),
                      Text('早参汤'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.doujiang, color: Colors.white),
                      Text('豆浆'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.doufunao, color: Colors.white),
                      Text('豆腐脑'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.youtiao, color: Colors.white),
                      Text('油条'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.eggs, color: Colors.white),
                      Text('鸡蛋'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.vegetables, color: Colors.white),
                      Text('蔬菜'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(MyIcons.fruit, color: Colors.white),
                      Text('水果'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          endDrawer: _buildDrawer(context),
          body: TabBarView(
            children: <Widget>[
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Container(
      height: 500.0,
      width: 240.0,
      child: ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Drawer(
          child: Container(
            padding: EdgeInsets.only(left: 40.0, right: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45)],
            ),
            // width: 300.0,
            // height: 500.0,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.power_settings_new),
                        color: primaryColor,
                        onPressed: () {
                          print('点击draw关闭');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.arrow_upward),
                          ),
                          Container(
                            child: Text(
                              '按照人气综合排序',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.arrow_upward),
                          ),
                          Container(
                            child: Text(
                              '按照销量排序',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.arrow_upward),
                          ),
                          Container(
                            child: Text(
                              '按照价格排序',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.arrow_upward),
                          ),
                          Container(
                            child: Text(
                              '按照评分综合排序',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
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
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.0),
      itemCount: goods.length,
      itemBuilder: (context, index) {
        return _buildArticleItem(index);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.0),
    );
  }

  Widget _buildArticleItem(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 3.0,
      child: Container(
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(6.0),
            ),
        // color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0)),
              ),
            ),
            Container(
              // color: Colors.white,
              // padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 70.0,
                    width: 70.0,
                    // color: Colors.blue,
                    child: OwnNetWorkImage(
                      goods[index]['picUrl'],
                      fit: BoxFit.cover,
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                  // SizedBox(width: 20.0),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              goods[index]['title'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '￥' + goods[index]['price'],
                                  style: TextStyle(
                                      fontSize: 16.0, color: primaryColor),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {
                                        print('点击收藏');
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_shopping_cart),
                                      onPressed: () {
                                        print('点击收藏');
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(40.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(40.0, size.height);
    path.quadraticBezierTo(0.0, size.height * 3 / 4, 0.0, size.height / 2);
    path.quadraticBezierTo(0.0, size.height / 4, 40.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
