part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class BasketInitialEvent extends BasketEvent {}

class BasketIncreaseEvent extends BasketEvent {
  final id;
  BasketIncreaseEvent({this.id});

}

class BasketDecreaseEvent extends BasketEvent {
  final id;
  BasketDecreaseEvent({this.id});

}