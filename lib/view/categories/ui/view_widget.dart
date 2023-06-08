import 'package:flutter/material.dart';

import '../bloc/categories_bloc.dart';


class ViewWidget extends StatelessWidget {
  const ViewWidget({Key? key,this.data,this.catogoryBloc}) : super(key: key);
  final data;
  final catogoryBloc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showAlert(context,data);
      },
      child: Column(
        children: [
          Expanded(
            flex: 7,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF8F7F5),
                  borderRadius: BorderRadius.circular(10)
                ),

                  child: Container(

                        height: 120,
                        width: 100,
                        child: Image.network("${data['image_url']}",)),
                  )),
          Expanded(
              flex: 3,
              child: Container(
            child: Text("${data['name']}",
            style: TextStyle(
              fontSize: 14
            ),),
          )),
        ],
      ),
    );
  }



    Future<void> showAlert(BuildContext context,data) {
    print(data);
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height/4,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffF8F7F5),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.network("${data['image_url']}"),
                        )),

                    Container(
                      height: MediaQuery.of(context).size.height/4,
                      width: double.maxFinite,
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.favorite_outline)),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.close)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),

                SizedBox(height: 5,),
                Text("${data['name']}",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Row(
                      children: [
                        Text("${data['price']}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),),

                        Icon(Icons.currency_ruble,size: 15,)
                      ],
                    ),

                    Text(" . ${data['weight']}г",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5)
                      ),),
                  ],
                ),
              ],
            ),
              content: Container(
                // height: MediaQuery.of(context).size.height/1.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child:
                    Text("${data['description']}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5)
                    ),),

              ),
              actions: <Widget>[

                InkWell(
                  onTap: (){
                      catogoryBloc.add(AddToCardEvent(data: data));
                      Navigator.pop(context);
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff3364E0),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: const  Text('Добавить в корзину',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),)),

                  ),
                ),
                SizedBox(height:5,)
              ],
          );
        },
      );
    }
}
