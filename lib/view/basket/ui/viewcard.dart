import 'package:flutter/material.dart';
import 'package:food_app/model/basket_model.dart';

import '../bloc/basket_bloc.dart';



class ViewCard extends StatelessWidget {
  const ViewCard({Key? key,required this.data,this.basketBloc,this.catNum}) : super(key: key);
  final BasketModel data;
  final basketBloc;
  final catNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(child: Container(

              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                   decoration: BoxDecoration(
                       color: Color(0xffF8F7F5),
                     borderRadius: BorderRadius.circular(10)
                   ),
                  child: Image.network("${data.image_url}"),
                ),
              ),
            )),
            Expanded(flex: 2,child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text("${data.name}",
                  style: TextStyle(
                    fontSize: 16
                  ),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("${data.price}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black
                            ),),

                          Icon(Icons.currency_ruble,size: 15,)
                        ],
                      ),

                      Text(" . ${data.weight.toString()}г",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5)
                        ),),
                    ],
                  ),
                ],
              ),
            )),
            Expanded(child: Container(

              child: Container(
                height: 40,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEFEEEC)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    btn("-",data.id),
                    Container(
                      height: 25,
                      width: 25,
                      child: Center(
                        child: Text("${data.num}",
                          style: TextStyle(
                              fontSize: 22
                          ),),
                      ),
                    ),
                    btn("+",data.id),

                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }


  Widget btn(String text,id){
    return InkWell(
      onTap: (){

        if(text == '-'){
          basketBloc.add(BasketDecreaseEvent(id: id));
        }else{
          basketBloc.add(BasketIncreaseEvent(id: id));
        }
      },
      child: Container(
        height: 25,
        width: 25,
        child: Center(
          child: Text("${text}",
            style: TextStyle(
                fontSize: 22
            ),),
        ),
      ),
    );
  }
}
