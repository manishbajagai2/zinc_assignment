import 'package:flutter/foundation.dart';
import 'package:zinc_assignment/models/product.dart';
import 'package:zinc_assignment/repositories/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      _products = await _repository.fetchProducts();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching products: $e');
    }
  }
}
