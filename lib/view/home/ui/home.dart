import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/view/home/bloc/home_bloc.dart';
import 'package:food_app/view/home/ui/view_data.dart';

import '../../categories/ui/categories.dart';
import 'homepage/homepage.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final homebloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  BlocConsumer<HomeBloc, HomeState>(
                bloc: homebloc,
                listener: (context, state) {
                  // TODO: implement listener
                  if(state is NavigateToCategoriesState){
                    print("Navigate");
                  }
                },
                listenWhen: (previous,current) => current is HomeActionState ,
                buildWhen: (previous,current) => current is !HomeActionState ,
                builder: (context, state) {
                  switch(state.runtimeType){
                    case LoadingHomeState:
                      return Container(
                          height: 500,
                          width: double.maxFinite,
                          child: Center(child:CircularProgressIndicator(),));

                    case SuccessState:
                      final data = state as SuccessState;

                      return  HomePage(data: data.data,homebloc: homebloc,);
                    case NavigateToCategoriesState:
                      return Categories();

                    default:
                      return Center(child:Text("default"),);
                  }

                },
              ),
    );
  }
}



