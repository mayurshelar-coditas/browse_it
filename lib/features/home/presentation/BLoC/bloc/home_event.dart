part of 'home_bloc.dart';

sealed class HomeEvent {}

//Events for Home Page
class FetchCategoriesEvent extends HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class OnCategoryClickedEvent extends HomeEvent {
  final String categoryName;

  OnCategoryClickedEvent({required this.categoryName});

}
