import 'dart:collection';
import 'dart:convert';  

import 'package:flutter/foundation.dart';
import 'package:fluttergetitdone/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemData with ChangeNotifier {
  List<Item> _items = [];
  List<String> _itemsList = [];
  void toggleStatus(int index) {
    _items[index].toggleStatus();
    setItemSharedPref(_items);

    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    setItemSharedPref(_items);

    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    setItemSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  static SharedPreferences _sharedPref;

  //Shared Pref methods
  Future<void> createItemSharedPref() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void setItemSharedPref(List<Item> items) {
    _itemsList.clear();
    for (var item in items) {
      _itemsList.add(json.encode(item.toMap()));
    }
    _sharedPref.setStringList("key", _itemsList);
  }

  void loadItemSharedPref() {
    _itemsList = _sharedPref.getStringList("key") ?? [];
    _items.clear();
    for (var item in _itemsList) {
      _items.add(Item.fromMap(json.decode(item)));
    }
  }
}
