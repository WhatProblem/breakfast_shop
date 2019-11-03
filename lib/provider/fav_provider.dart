import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavProvider extends ChangeNotifier {
  List<Map> _myFav = [];

  List get myFav => _myFav;

  addFav(Map favInfo) {
    Map newFav = new Map();
    newFav.addAll(favInfo);
    if (!_hasEle(favInfo)) {
      _myFav.add(newFav);
    } else {
      removeFav(favInfo);
    }
    notifyListeners();
  }

  removeFav(Map favInfo) {
    _myFav.removeWhere((Map item) => item['id'] == favInfo['id']);
    notifyListeners();
  }

  _hasEle(Map goodsInfo) {
    return _myFav.any((item) => item['id'] == goodsInfo['id']);
  }
}
