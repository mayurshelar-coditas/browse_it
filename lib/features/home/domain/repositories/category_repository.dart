import 'package:browse_it/core/errors/failure.dart';
import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
