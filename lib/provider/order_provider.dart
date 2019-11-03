import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderProvider extends ChangeNotifier {
  List<Map> _myOrder = [];

  List get myOrder => _myOrder;

  // 添加商品到购物车
  add(int nums, Map goodsInfo) {
    Map newOrder = new Map();
    newOrder.addAll(goodsInfo);
    if (!_hasEle(goodsInfo)) {
      newOrder['nums'] = nums;
      _myOrder.add(newOrder);
    } else {
      _addNum(goodsInfo);
    }
    notifyListeners();
  }

  // 从购物车删除商品
  remove(Map goodsInfo) {
    _myOrder.removeWhere((Map item) => item['id'] == goodsInfo['id']);
    notifyListeners();
  }

  // 添加购物车商品数量
  addNums(Map goodsInfo) {
    _myOrder = _addNum(goodsInfo);
    notifyListeners();
  }

  // 减少数量
  cutNums(Map goodsInfo) {
    _myOrder = _myOrder.map((item) {
      if (item['id'] == goodsInfo['id'] && item['nums'] > 1) {
        item['nums']--;
      }
      return item;
    }).toList();
    notifyListeners();
  }

  _addNum(Map goodsInfo) {
    return _myOrder.map((item) {
      if (item['id'] == goodsInfo['id']) {
        item['nums']++;
      }
      return item;
    }).toList();
  }

  _hasEle(Map goodsInfo) {
    return _myOrder.any((item) => item['id'] == goodsInfo['id']);
  }
}
