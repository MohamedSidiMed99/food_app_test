part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

abstract class CategoriesActionState extends CategoriesState {}


class CategoriesInitial extends CategoriesState {}


class CategoriesLoadingState extends CategoriesState{}

class CategoriesSuccessState extends CategoriesState{
  final  categories;

  CategoriesSuccessState({required this.categories});
}