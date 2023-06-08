part of 'basket_bloc.dart';

@immutable
abstract class BasketState {}

abstract class BasketActionState extends BasketState {}

class BasketInitial extends BasketState {}

class BasketLoadingState extends BasketState {}

class BasketSuccessState extends BasketState {

  final List<BasketModel> BasketData;
  final catNum;
  var value;
  final id;
  final incdec;


  BasketSuccessState({required this.BasketData,this.catNum,this.value,this.id,this.incdec});

}
