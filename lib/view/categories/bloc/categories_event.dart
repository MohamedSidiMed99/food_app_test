part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}


class CategoriesInitialEvent extends CategoriesEvent{}


class AddToCardEvent extends CategoriesEvent {
  final data ;

  AddToCardEvent({this.data});
}

class GetTypeCategoryEvent extends CategoriesEvent {
  final type ;

  GetTypeCategoryEvent({this.type});
}
