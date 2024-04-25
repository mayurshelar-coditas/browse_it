import 'package:browse_it/features/home/data/data_source/category_data_source.dart';
import 'package:browse_it/features/home/data/data_source/category_data_source_implementation.dart';
import 'package:browse_it/features/home/data/data_source/product_data_source.dart';
import 'package:browse_it/features/home/data/data_source/product_data_source_implementation.dart';
import 'package:browse_it/features/home/data/repositories/category_repository_implementation.dart';
import 'package:browse_it/features/home/data/repositories/product_repository_implementation.dart';
import 'package:browse_it/features/home/domain/repositories/product_repository.dart';
import 'package:browse_it/features/home/domain/usecases/fetch_categories.dart';
import 'package:browse_it/features/home/domain/usecases/fetch_category_based_products.dart';

import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  ProductDataSource productDataSource = ProductDataSourceImplementation();
  ProductRepository productRepository = ProductRepositoryImplementation();
  FetchCategoryBasedProducts fetchProducts = FetchCategoryBasedProducts();

  locator.registerSingleton(productDataSource);
  locator.registerSingleton(productRepository);
  locator.registerSingleton(fetchProducts);

  CategoryDataSource categoryDataSource = CategoryDataSourceImplementation();
  CategoryRepsoitoryImplementation categoryRepsoitory =
      CategoryRepsoitoryImplementation();
  FetchCategories fetchCategories = FetchCategories();

  locator.registerSingleton(categoryDataSource);
  locator.registerSingleton(categoryRepsoitory);
  locator.registerSingleton(fetchCategories);
}
