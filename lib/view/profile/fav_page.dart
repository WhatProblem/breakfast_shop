import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../provider/fav_provider.dart';

class FavPage extends StatelessWidget {
  final Color primaryColor = Colors.orange[300];
  final TextStyle primaryStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏', style: primaryStyle),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 2.0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('管理',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
      body: Consumer<FavProvider>(
        builder: (context, favProvider, _) {
          return favProvider.myFav.length > 0
              ? _buildList(favProvider)
              : Center(
                  child: Text(
                    '您还没有收藏',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0,
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildList(FavProvider favProvider) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(6.0),
      itemCount: favProvider.myFav.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3.0,
          child: Row(
            children: <Widget>[
              Container(
                width: 110.0,
                height: 105.0,
                padding: EdgeInsets.only(
                    // left: 0.0,
                    // top: 10.0,
                    // right: 20.0,
                    // bottom: 40.0,
                    ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        favProvider.myFav[index]['picUrl']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  // color: Colors.deepOrange,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(favProvider.myFav[index]['title'],
                          style: primaryStyle),
                      Text(
                        '单价 ${favProvider.myFav[index]['price']}',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      favProvider.myFav[index]['title'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      favProvider.myFav[index]['price'],
                      style: TextStyle(fontSize: 16.0, color: Colors.black87),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Icon(Icons.star, color: primaryColor, size: 18.0),
                      Icon(Icons.star, color: primaryColor, size: 18.0),
                      Icon(Icons.star, color: primaryColor, size: 18.0),
                      Icon(Icons.star, color: primaryColor, size: 18.0),
                      Icon(Icons.star, color: primaryColor, size: 18.0),
                    ])
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
