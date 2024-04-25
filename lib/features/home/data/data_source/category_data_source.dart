import 'package:browse_it/features/home/domain/entities/category_entity.dart';

abstract class CategoryDataSource {
  Future<List<CategoryEntity>> getCategories();
}
