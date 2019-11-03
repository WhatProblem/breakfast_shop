import 'package:flutter/material.dart';
import 'home/home.dart';
import 'sort/sort.dart';
import 'cart/cart.dart';
import 'profile/profile.dart';

import 'package:provider/provider.dart';
import '../provider/order_provider.dart';
import '../provider/fav_provider.dart';
import '../provider/scroll_provider.dart';

class IndeBreakfastPage extends StatefulWidget {
  @override
  _IndeBreakfastPageState createState() => _IndeBreakfastPageState();
}

class _IndeBreakfastPageState extends State<IndeBreakfastPage> {
  int _currentIndex = 0;

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
  ];

  List<Widget> pageItems = <Widget>[
    HomePage(),
    SortPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => OrderProvider()),
        ChangeNotifierProvider(builder: (_) => FavProvider())
      ],
      child: MaterialApp(
        home: Consumer2<OrderProvider, FavProvider>(
          builder: (context, orderProvider, favProvider, _) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: navItems,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.orange[300],
                currentIndex: _currentIndex,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              body: IndexedStack(
                index: _currentIndex,
                children: pageItems,
              ),
            );
          },
        ),
      ),
    );
  }
}
