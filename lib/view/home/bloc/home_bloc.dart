import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_app/data/home_data.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<GoToCategoriesEvent>(goToCategoriesEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {

    emit(LoadingHomeState());

    await Future.delayed(Duration(seconds: 1));

    emit(SuccessState(data: categories));


  }

  FutureOr<void> goToCategoriesEvent(GoToCategoriesEvent event, Emitter<HomeState> emit)async {
     emit(NavigateToCategoriesState());
  }
}
