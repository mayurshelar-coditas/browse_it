import 'dart:convert';

import 'package:browse_it/core/errors/exceptions.dart';
import 'package:browse_it/features/home/data/data_source/category_data_source.dart';
import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:http/http.dart' as http;

class CategoryDataSourceImplementation extends CategoryDataSource {
  List<CategoryEntity> listOfcategories = [];

  @override
  Future<List<CategoryEntity>> getCategories() async {
    //Here we will make the api calls to fetch the list of categories
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    var categoires = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (String category in categoires) {
        listOfcategories.add(CategoryEntity(name: category));
      }
      return listOfcategories;
    } else {
      throw ServerException();
    }
  }
}
