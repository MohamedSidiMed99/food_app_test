import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/view/basket/ui/viewcard.dart';

import '../../custom_widgets/header_custom_widget.dart';
import '../bloc/basket_bloc.dart';


class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {

  final basketBloc = BasketBloc();
   int value = 0;

  @override
  void initState() {

    basketBloc.add(BasketInitialEvent());

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ///--------------header ----------------
            HeaderCustom(),


            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1.3,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: BlocConsumer<BasketBloc, BasketState>(
                        bloc: basketBloc,
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        listenWhen: (previous , current) => current is BasketActionState,
                        buildWhen:  (previous , current) => current is !BasketActionState,
                        builder: (context, state) {
                          switch(state.runtimeType){
                            case BasketLoadingState :
                              return Center(child: CircularProgressIndicator(),);
                            case BasketSuccessState:
                              final basketData = state as BasketSuccessState;

                              return Column(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: ListView.builder(
                                        itemCount: basketData.BasketData.length,
                                        itemBuilder: (ctx, index) {

                                          return ViewCard(data: basketData.BasketData[index],basketBloc: basketBloc,catNum: basketData.catNum ,);
                                        }),
                                  ),

                                  Expanded(
                                      child: Container(

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                color: Color(0xff3364E0),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(child: Text("Оплатить ${basketData.value} ₽",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500
                                              ),)),
                                          ),
                                        ),
                                      )),
                                ],
                              );
                            default:
                              return Center(child: Text("Default"),);
                          }

                        },
                      )),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
