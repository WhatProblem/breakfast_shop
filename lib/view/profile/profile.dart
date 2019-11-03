import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../config/network_image.dart';
import '../../icons/icons.dart';
import './fav_page.dart';
import '../../provider/fav_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final String avatars =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571757609109&di=4cf38eaca8d0f30a04eb8378b2942740&imgtype=0&src=http://d.hiphotos.baidu.com/zhidao/pic/item/8644ebf81a4c510f9a4fd0266359252dd42aa506.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<FavProvider>(
      builder: (context, favProvider, _) {
        return Stack(
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange[600], Colors.orange[300]]),
              ),
            ),
            ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                _buildHeader(context),
                _buildUserInfo(context),
              ],
            ),
          ],
        );
      },
    ));
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '用户信息',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Divider(color: Colors.black38),
                  Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: ListTile(
                              leading: Icon(Icons.favorite),
                              title: Text("我的收藏"),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, size: 14.0),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => FavPage()
                                  ),
                            );
                          },
                        ),
                        Divider(color: Colors.black12),
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: ListTile(
                              leading: Icon(Icons.credit_card),
                              title: Text("卡券"),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, size: 14.0),
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12),
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: ListTile(
                              leading: Icon(Icons.history),
                              title: Text("全部订单"),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, size: 14.0),
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12),
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, size: 14.0),
                              title: Text("用户设置"),
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12),
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: ListTile(
                              leading: Icon(Icons.score),
                              title: Text("用户积分"),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, size: 14.0),
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12),
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text("详细配送地址"),
                              trailing:
                                  Icon(Icons.arrow_forward_ios, size: 14.0),
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text(
                    '当前用户',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16.0),
                  Text('UI/UX designer | Foodie | Kathmandu'),
                  SizedBox(height: 16.0),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '302',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'POSTS'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '302',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'POSTS'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '302',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'POSTS'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: CachedNetworkImageProvider(avatars),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
