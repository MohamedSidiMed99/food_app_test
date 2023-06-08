part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class LoadingHomeState extends HomeState{}

class SuccessState extends HomeState {
  final List data ;

  SuccessState({required this.data});

}


class NavigateToCategoriesState extends HomeState{}