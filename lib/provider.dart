
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:module_6/model.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cart = [];
  List<Cart> get cart => _cart;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String baseUrl = "https://dummyjson.com/carts/1";

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['products'];
        final List<dynamic> products = data;
        _cart = products.map((product) => Cart.fromJson(product)).toList();
      } else {
        if (kDebugMode) {
          print('Failed to load data');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('error fetching data :' + e.toString());
      }
    }
    _isLoading = false;
    notifyListeners();
  }
}
