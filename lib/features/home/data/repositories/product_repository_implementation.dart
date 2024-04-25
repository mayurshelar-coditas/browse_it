import 'package:browse_it/core/di/di_container.dart';
import 'package:browse_it/core/errors/exceptions.dart';
import 'package:browse_it/core/errors/failure.dart';
import 'package:browse_it/features/home/data/data_source/product_data_source.dart';
import 'package:browse_it/features/home/domain/entities/product_entity.dart';
import 'package:browse_it/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImplementation extends ProductRepository {
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductByCategory(
      String category) async {
    try {
      final products =
          await locator<ProductDataSource>().getProductByCategory(category);
      return Right(products);
    } on ServerException {
      return Left(ServerFailure(errorMessage: "Something went wrong!"));
    }
  }
}
