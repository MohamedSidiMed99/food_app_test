import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_app/model/basket_model.dart';
import 'package:meta/meta.dart';

import '../../../data/basket_data.dart';
import '../../../data/categories_data.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesInitialEvent>(categoriesInitialEvent);

    on<AddToCardEvent>(addToCardEvent);

    on<GetTypeCategoryEvent>(getTypeCategoryEvent);

  }

  FutureOr<void> categoriesInitialEvent(CategoriesInitialEvent event, Emitter<CategoriesState> emit) async{
    emit(CategoriesLoadingState());

    await Future.delayed(Duration(seconds: 2));

    emit(CategoriesSuccessState(categories: categoriesData));

  }

  FutureOr<void> addToCardEvent(AddToCardEvent event, Emitter<CategoriesState> emit)async {

    basketData.add(event.data);
    int last = basketData.length ;
    basketData[last-1]['num'] = 1;


  }


  FutureOr<void> getTypeCategoryEvent(GetTypeCategoryEvent event, Emitter<CategoriesState> emit) async{


    List list = [];

    List newData = [];

    for(int i = 0 ; i < categoriesData['dishes']!.length ; i++){
      list.clear();
      list.add(categoriesData['dishes']![i]['tegs']);

      if(list[0].contains((event.type))){

        newData.add(categoriesData['dishes']![i]);
      }else{

      }

    }

    print(newData);



    emit(CategoriesSuccessState(categories: {"dishes":newData}));
  }
}
