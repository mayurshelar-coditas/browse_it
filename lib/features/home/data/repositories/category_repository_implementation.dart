import 'package:browse_it/core/di/di_container.dart';
import 'package:browse_it/core/errors/exceptions.dart';
import 'package:browse_it/core/errors/failure.dart';
import 'package:browse_it/features/home/data/data_source/category_data_source.dart';
import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:browse_it/features/home/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepsoitoryImplementation extends CategoryRepository {
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    //Before pushing implement local and remote data source implementation
    try {
      final categories = await locator<CategoryDataSource>().getCategories();

      return Right(categories);
    } on ServerException {
      return Left(
        ServerFailure(errorMessage: 'Something went wrong!'),
      );
    }
  }
}
