import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_app/data/basket_data.dart';
import 'package:food_app/model/basket_model.dart';
import 'package:meta/meta.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<BasketInitialEvent>(basketInitialEvent);

    on<BasketIncreaseEvent>(basketIncreaseEvent);
    on<BasketDecreaseEvent>(basketDecreaseEvent);
  }

  int catNum = 0;

  FutureOr<void> basketInitialEvent(BasketInitialEvent event, Emitter<BasketState> emit)async {

    emit(BasketLoadingState());
    await Future.delayed(Duration(seconds: 2));

    emit(BasketSuccessState(BasketData: basketData.map((e) => BasketModel(
      id: e['id'],
      name: e['name'],
      price: e['price'],
      weight: e['weight'],
      description: e['description'],
      image_url: e['image_url'],
      num: e['num'],
    )).toList(),catNum: catNum,value:calcallDemand()));
  }

  FutureOr<void> basketIncreaseEvent(BasketIncreaseEvent event, Emitter<BasketState> emit)async {


   var d =  basketData.firstWhere((e){
     return e['id'] == event.id;
    } ) ;

    d['num']++;

    emit(BasketSuccessState(BasketData: basketData.map((e) => BasketModel(
      id: e['id'],
      name: e['name'],
      price: e['price'],
      weight: e['weight'],
      description: e['description'],
      image_url: e['image_url'],
      num:e['num'],
    )).toList(),id: event.id,incdec: 1,value:calcallDemand()));

  }

  FutureOr<void> basketDecreaseEvent(BasketDecreaseEvent event, Emitter<BasketState> emit) async{


    var d =  basketData.firstWhere((e){
      return e['id'] == event.id;
    } ) ;

    if(d['num'] <= 1){
      basketData.remove(d);
    }else{
      d['num']--;
    }


    emit(BasketSuccessState(BasketData: basketData.map((e) => BasketModel(
      id: e['id'],
      name: e['name'],
      price: e['price'],
      weight: e['weight'],
      description: e['description'],
      image_url: e['image_url'],
      num: e['num'],
    )).toList(),id: event.id,incdec: 0,value:calcallDemand()));
  }

  calcallDemand(){
    int? value = 0 ;
    for(int i = 0 ; i < basketData.length ; i++){

     value = (value! + (basketData[i]['price'] * basketData[i]['num'])) as int?;
    }

    return value;
  }
}
