import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../mock/mock.dart';
import '../../config/network_image.dart';
import 'package:provider/provider.dart';
import '../../provider/order_provider.dart';
import '../../provider/fav_provider.dart';
import '../detail/detail.dart';
import './animate_bar.dart';
import '../../provider/scroll_provider.dart';
import '../../provider/init_model_provider.dart';
import '../search/search_page.dart';

class HomePage extends StatelessWidget {
  final List result = data['goods'];
  final List sliderItems = data['goods'].take(4).toList();
  List themeSort = data['themeSort'];
  List discount = data['discount'].take(5).toList();
  List popular = data['popular'];
  List recommend = data['recommend'];
  Map advert = data['advert'];

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ScrollProvider>(
      model: ScrollProvider(PrimaryScrollController.of(context)),
      onModelReay: (scrollModel) {
        scrollModel.init();
      },
      builder: (context, scrollModel, child) {
        return Scaffold(
          body: CustomScrollView(
            controller: scrollModel.scrollController,
            slivers: <Widget>[
              // 顶部搜索栏
              _buildAnimateAppBar(context, scrollModel),
              // 轮播
              // 分类主题部分
              _buildTheme(),
              // 限时优惠标题
              _buildHeader(
                context,
                title: '限时优惠',
                endTime: '结束时间:2019-10-21 12:00:00',
              ),
              // 限时优惠列表
              _buildDiscount(),
              _buildAdvert(),
              // 热销标题
              _buildHeader(context, title: '火爆热销'),
              // 受欢迎部分
              _buildPopular(),
              // 历史推荐标题
              _buildHeader(context, title: '为您推荐'),
              // 根据历史推荐部分
              _buildRecommend(),
            ],
          ),
        );
      },
    );
  }

  SliverAppBar _buildAnimateAppBar(
      BuildContext context, ScrollProvider scrollProvider) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.orange[300],
      expandedHeight: 200.0,
      brightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.light
          : Brightness.dark,
      actions: <Widget>[
        // AnimatedSwitcher(
        //   duration: Duration(milliseconds: 300),
        //   transitionBuilder: (child, animation)=>ScaleTransition(
        //     scale: animation,
        //     child: child,
        //   ),
        //   child: SizedBox.shrink(),
        // ),
        AnimateBar(
            display: scrollProvider.showTopBtn,
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('搜索');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                })),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: _buildBanner(),
        centerTitle: true,
        title: GestureDetector(
          child: AnimateBar(
            display: scrollProvider.showTopBtn,
            child: Text(
              'Welcome Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 200.0,
      width: double.infinity,
      child: Swiper(
        itemCount: sliderItems.length,
        autoplay: true,
        curve: Curves.easeIn,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return DetailPage(goodsInfo: sliderItems[index]);
              }));
              print(result);
            },
            child: OwnNetWorkImage(sliderItems[index]['picUrl'],
                fit: BoxFit.cover),
          );
        },
        pagination: new SwiperPagination(),
      ),
    );
  }

  List _themeList(List lists) {
    return lists.map((item) {
      return Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: OwnNetWorkImage(
                  item['picUrl'],
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text('${item['name']}'),
            ],
          ),
        ),
      );
    }).toList();
  }

  SliverToBoxAdapter _buildTheme() {
    List firstRow = themeSort.take(4).toList();
    List secondRow = themeSort.skip(4).toList();
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: _themeList(firstRow),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                children: _themeList(secondRow),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(BuildContext context,
      {String title, String endTime}) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4.0),
                Container(
                  height: 18.0,
                  alignment: Alignment.center,
                  padding: endTime != null
                      ? EdgeInsets.symmetric(horizontal: 6.0)
                      : null,
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: endTime != null
                      ? Text(
                          endTime,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        )
                      : null,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print('点击显示更多');
              },
              child: Text(
                '更多>',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildDiscount() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 210.0,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemExtent: 150.0,
          // 滚动视图将扩展到允许的最大大小。如果是无界约束，则 shrinkWrap 必须为 true
          // shrinkWrap: true,
          itemCount: discount.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                print('点击进入详情');
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return DetailPage(goodsInfo: discount[index]);
                }));
                print(result);
              },
              child: Card(
                child: Container(
                  // margin: EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: OwnNetWorkImage(
                          discount[index]['picUrl'],
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: double.infinity,
                        ),
                      ),
                      // SizedBox(height: 10.0),
                      Container(
                        height: 30.0,
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.orange[300],
                          // borderRadius: BorderRadius.circular(15.0),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          discount[index]['title'],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '￥',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.redAccent[400]),
                            ),
                            Text(
                              '${discount[index]['price']}',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.redAccent[400]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAdvert() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 80.0,
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(60.0),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: OwnNetWorkImage(advert['picUrl'], fit: BoxFit.cover),
        ),
      ),
    );
  }

  SliverGrid _buildPopular() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              print('点击');
              // print(popular[index]);
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return DetailPage(goodsInfo: popular[index]);
              }));
              print(result);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => DetailPage()));
            },
            child: Container(
              child: Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  // decoration: BoxDecoration(boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey[300],
                  //     offset: Offset(0.0, 5.0),
                  //     blurRadius: 10.0,
                  //   ),
                  // ]),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(3.0, 3.0),
                              blurRadius: 1.0,
                            ),
                          ]),
                          child: OwnNetWorkImage(
                            popular[index]['picUrl'],
                            fit: BoxFit.cover,
                            height: 140.0,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          popular[index]['title'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(height: 5.0),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '￥',
                                style: TextStyle(
                                  color: Colors.redAccent[400],
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                '${popular[index]['price']}',
                                style: TextStyle(
                                  color: Colors.redAccent[400],
                                  fontSize: 16.0,
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
          );
        },
        childCount: popular.length,
      ),
    );
  }

  SliverList _buildRecommend() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return DetailPage(goodsInfo: recommend[index]);
              }));
              print(result);
            },
            child: Container(
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey[300],
              //       offset: Offset(5.0, 5.0),
              //       blurRadius: 10.0,
              //     ),
              //   ],
              // ),
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      child: OwnNetWorkImage(
                        recommend[index]['picUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            recommend[index]['title'],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '￥',
                                style: TextStyle(
                                  color: Colors.redAccent[400],
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                '${recommend[index]['price']}',
                                style: TextStyle(
                                    color: Colors.redAccent[400],
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Consumer<FavProvider>(
                                builder: (context, favProvider, _) {
                                  return IconButton(
                                    icon: Icon(
                                      _isFav(recommend[index],
                                              favProvider.myFav)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.orange[300],
                                    ),
                                    onPressed: () {
                                      favProvider.addFav(recommend[index]);
                                    },
                                  );
                                },
                              ),
                              Consumer<OrderProvider>(
                                builder: (context, orderProvider, _) {
                                  return Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.orange[300],
                                          ),
                                          onPressed: () {
                                            orderProvider.add(
                                                1, recommend[index]);
                                            print(orderProvider.myOrder.length);
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top: 2.0,
                                        right: 10.0,
                                        child: _isCurrntGoodsNums(
                                                    recommend[index],
                                                    orderProvider.myOrder) ==
                                                '0'
                                            ? Container()
                                            : Container(
                                                alignment: Alignment.center,
                                                width: 16.0,
                                                height: 16.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: Colors.orange[300],
                                                ),
                                                child: Text(
                                                  _isCurrntGoodsNums(
                                                      recommend[index],
                                                      orderProvider.myOrder),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: recommend.length,
      ),
    );
  }

  bool _isFav(Map favInfo, List favList) {
    return favList.any((item) => item['id'] == favInfo['id']);
  }

  String _isCurrntGoodsNums(Map orderInfo, List orderList) {
    for (int i = 0; i < orderList.length; i++) {
      if (orderList[i]['id'] == orderInfo['id']) {
        return orderList[i]['nums'].toString();
      }
    }
    return '0';
  }
}
