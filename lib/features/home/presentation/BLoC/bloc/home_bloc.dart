import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:browse_it/core/di/di_container.dart';

import 'package:browse_it/features/home/domain/entities/category_entity.dart';
import 'package:browse_it/features/home/domain/entities/product_entity.dart';

import 'package:browse_it/features/home/domain/usecases/fetch_categories.dart';
import 'package:browse_it/features/home/domain/usecases/fetch_category_based_products.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    on<HomeInitialEvent>(homeInitialEvent);

    on<FetchCategoriesEvent>(fetchCategoriesEvent);

    on<OnCategoryClickedEvent>(onCategoryClickedEvent);
  }

//Implementation logic for home page
  void loadCategories() {
    add(HomeInitialEvent());
  }

  FutureOr<void> fetchCategoriesEvent(
      FetchCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(LoadingCategoriesState());

    final result = await locator<FetchCategories>().call();
    result.fold(
      (failure) => emit(
        FailureLoadingCategoriesState(),
      ),
      (categories) => emit(
        SuccessLoadingCategoriesState(categories: categories),
      ),
    );
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(LoadingCategoriesState());

    final result = await locator<FetchCategories>().call();
    result.fold(
      (failure) => emit(
        FailureLoadingCategoriesState(),
      ),
      (categories) => emit(
        SuccessLoadingCategoriesState(categories: categories),
      ),
    );
  }

  FutureOr<void> onCategoryClickedEvent(
      OnCategoryClickedEvent event, Emitter<HomeState> emit) async {
    emit(NavigateToProductsPage());

    emit(LoadingProductsListPage());

    final result =
        await locator<FetchCategoryBasedProducts>().call(event.categoryName);
    result.fold(
      (failure) => emit(
        FailureLoadingProductsListPage(),
      ),
      (products) => emit(
        SuccessLoadingProductsListPage(products: products),
      ),
    );
  }
}
