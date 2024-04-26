
import 'package:browse_it/features/home/data/models/product_model.dart';



abstract class ProductDataSource {
  Future<List<ProductModel>>  getProductByCategory(String category);
}


