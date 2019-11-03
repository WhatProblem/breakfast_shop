import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/order_provider.dart';
import '../../config/network_image.dart';

class DetailPage extends StatefulWidget {
  Map goodsInfo;
  DetailPage({Key key, @required this.goodsInfo}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color primaryColor = Colors.orange[300];
  int nums;

  @override
  void initState() {
    nums = widget.goodsInfo['nums'] == null ? 0 : widget.goodsInfo['nums'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.goodsInfo['title']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, '这是返回值'),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, _) {
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: OwnNetWorkImage(
                          widget.goodsInfo['picUrl'],
                          fit: BoxFit.cover,
                          height: 336.0,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        height: 36.0,
                        padding: EdgeInsets.only(left: 32.0),
                        child: Row(
                          children: _buildScore(widget.goodsInfo['score']),
                        ),
                      ),
                      Container(
                          height: 36.0,
                          padding: EdgeInsets.only(left: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '￥',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '${widget.goodsInfo['price']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 28.0,
                                ),
                              ),
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ExpansionTile(
                          title: Text(
                            '餐品详情',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 10.0,
                              ),
                              alignment: Alignment.topLeft,
                              child: Text(widget.goodsInfo['detail']),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  height: 110.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 6.0),
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 32.0, right: 16.0),
                              child: Text('购买数量'),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.add_circle),
                                    color: Colors.orange[300],
                                    onPressed: () {
                                      setState(() {
                                        nums++;
                                      });
                                    },
                                  ),
                                  Container(
                                    child: Text(
                                      '$nums'.toString(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_circle,
                                      color: Colors.orange[300],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (nums > 0) {
                                          nums--;
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 46.0,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(right: 10.0),
                                child: RaisedButton(
                                  color: Colors.pinkAccent[400],
                                  child: Text(
                                    '确定',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    orderProvider.add(nums, widget.goodsInfo);
                                    Navigator.pop(context, '从购物车返回数据带有订单数');
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: FlatButton(
                                  child: Text('返回'),
                                  onPressed: () {
                                    Navigator.pop(context, '从详情页返回');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildScore(num score) {
    List<Widget> starList = [];
    for (int i = 0; i < score.floor(); i++) {
      starList.add(Icon(Icons.star, color: primaryColor));
    }

    for (int j = 0; j < 5 - score.floor(); j++) {
      starList.add(Icon(Icons.star_border, color: primaryColor));
    }
    starList.add(Text('${score.toDouble()}分', style: TextStyle(fontSize: 16.0, color: Colors.black38)));
    return starList;
  }
}
