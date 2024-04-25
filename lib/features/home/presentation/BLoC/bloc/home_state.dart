// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

sealed class HomeActionState extends HomeState {}

//States for Home page
class LoadingCategoriesState extends HomeState {}

class SuccessLoadingCategoriesState extends HomeState {
  List<CategoryEntity> categories;
  SuccessLoadingCategoriesState({
    required this.categories,
  });
}

class FailureLoadingCategoriesState extends HomeState {}

//States for Displaying Products fetched through API
class NavigateToProductsPage extends HomeActionState {}

class LoadingProductsListPage extends HomeState {}

class FailureLoadingProductsListPage extends HomeState {}

class SuccessLoadingProductsListPage extends HomeState {
  List<ProductEntity> products;
  
  SuccessLoadingProductsListPage({
    required this.products,
  });
}
