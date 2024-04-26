import 'dart:convert';

import 'package:browse_it/core/errors/exceptions.dart';
import 'package:browse_it/features/home/data/data_source/product_data_source.dart';
import 'package:browse_it/features/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDataSourceImplementation extends ProductDataSource {
  List<ProductModel> listOfProducts = [];

  @override
  Future<List<ProductModel>> getProductByCategory(String category) async {
    //Here we will make the api calls to fetch the list of categories
    String uri;
    if (category == 'all') {
      uri = 'https://fakestoreapi.com/products/';
    } else {
      uri = 'https://fakestoreapi.com/products/category/$category';
    }
    final response = await http.get(Uri.parse(uri));

    var products = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var product in products) {
        listOfProducts.add(ProductModel.fromJson(product));
      }
      return listOfProducts;
    } else {
      throw ServerException();
    }
  }
}
