
import 'package:browse_it/core/errors/failure.dart';
import 'package:browse_it/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>>   getProductByCategory(String category);
}
