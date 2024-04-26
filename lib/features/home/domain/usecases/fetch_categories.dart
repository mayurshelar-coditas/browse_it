import 'package:browse_it/core/di/di_container.dart';
import 'package:browse_it/core/errors/failure.dart';
import 'package:browse_it/features/home/data/repositories/category_repository_implementation.dart';
import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

class FetchCategories {

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return locator<CategoryRepsoitory>().getCategories();
  }
}
