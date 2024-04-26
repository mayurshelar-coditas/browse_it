// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:browse_it/core/di/di_container.dart';
import 'package:browse_it/core/errors/failure.dart';
import 'package:browse_it/features/home/domain/entities/product_entity.dart';
import 'package:browse_it/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class FetchCategoryBasedProducts {
  Future<Either<Failure, List<ProductEntity>>> call(String category) async {
    return locator<ProductRepository>().getProductByCategory(category);
  }
}
