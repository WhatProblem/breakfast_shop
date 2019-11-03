import 'package:flutter/material.dart';
import '../../mock/mock.dart';
import '../../config/network_image.dart';
import '../../icons/icons.dart';
import '../../provider/order_provider.dart';
import 'package:provider/provider.dart';
import '../detail/detail.dart';

class CartPage extends StatelessWidget {
  final Color primaryColor = Colors.orange[300];
  final List<Map> goods = data['goods'];

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    List<Map> orderList = Provider.of<OrderProvider>(context).myOrder;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: primaryColor,
        title: Text(
          '购物车',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerRight,
            child: Text(
              '管理',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: orderList.length <= 0
            ? Center(
                child: Text(
                  '亲，去添加商品吧',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14.0,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16.0),
                      // itemCount: goods.length,
                      itemCount: orderList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            var result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailPage(goodsInfo: orderList[index]);
                            }));
                            print(result);
                          },
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                margin:
                                    EdgeInsets.only(right: 30.0, bottom: 10.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(5.0),
                                  elevation: 3.0,
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 30.0,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: IconButton(
                                            icon: Icon(
                                              MyIcons.circleUnCheck,
                                              color: primaryColor,
                                            ),
                                            onPressed: () {
                                              print('点击切换按钮状态');
                                            },
                                          ),
                                        ),
                                        Container(
                                          color: Colors.pink,
                                          height: 80.0,
                                          child: OwnNetWorkImage(
                                            // goods[index]['picUrl'],
                                            orderList[index]['picUrl'],
                                            fit: BoxFit.cover,
                                            height: 80.0,
                                            width: 80.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                // goods[index]['title'],
                                                orderList[index]['title'],
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 20.0),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      '￥',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .redAccent[400],
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      // '${goods[index]['price']}',
                                                      '${orderList[index]['price']}',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .redAccent[400],
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  size: 22.0,
                                                  color: primaryColor,
                                                ),
                                                onPressed: () {
                                                  orderProvider.addNums(
                                                      orderList[index]);
                                                },
                                              ),
                                              Text(
                                                '${orderList[index]['nums']}',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  size: 22.0,
                                                  color: primaryColor,
                                                ),
                                                onPressed: () {
                                                  orderProvider.cutNums(
                                                      orderList[index]);
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20.0,
                                right: 15.0,
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  alignment: Alignment.center,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.all(0.0),
                                    color: Colors.pinkAccent,
                                    child:
                                        Icon(Icons.clear, color: Colors.white),
                                    onPressed: () {
                                      print('删除当前$index');
                                      orderProvider.remove(orderList[index]);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '优惠 ￥ ${_buildTotal(orderList) > 5 ? 5.00 : 0.00}',
                                style: TextStyle(
                                    color: Colors.redAccent[400],
                                    fontSize: 16.0),
                              ),
                              Text(
                                '实付 ￥${_buildTotal(orderList) > 5 ? _buildTotal(orderList) - 5.00 : _buildTotal(orderList)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            height: 50.0,
                            color: Colors.pinkAccent,
                            child: Text('去结账',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0)),
                            onPressed: () {
                              print('支付');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  num _buildTotal(List orderList) {
    double total = 0.00;
    orderList
        .forEach((item) => total += item['nums'] * double.parse(item['price']));
    // orderList.forEach((item){
    //   print(item['nums']);
    //   print(item['price']);
    // });
    // print(total);
    return total;
  }
}
