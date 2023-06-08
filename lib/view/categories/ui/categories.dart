import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/view/categories/ui/view_widget.dart';
import 'package:food_app/view/home/bloc/home_bloc.dart';

import '../bloc/categories_bloc.dart';


class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  final categoriesBloc = CategoriesBloc();
  final homebloc = HomeBloc();
  
  List list = [
    "Все меню",
    "Салаты",
    "С рисом",
    "С рыбой"
  ];

  int check = 0;

  @override
  void initState() {
    
    categoriesBloc.add(CategoriesInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,

          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      homebloc.add(HomeInitialEvent());
                    }, icon:  Icon(Icons.arrow_back_ios, size: 20),),


                  Text("Азиатская кухня",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),),

                      CircleAvatar(
                        radius: 25,
                        foregroundImage: AssetImage("images/profile.jpeg"),
                      )

                ],
              ),
            ),

            SizedBox(height: 10,),

            ///------------------------- list ---------------------
            Container(
              width: double.maxFinite,
              height: 55,
              child: ListView.builder(
                shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (ctx,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            check = index;
                            categoriesBloc.add(GetTypeCategoryEvent(type: list[index]));
                          });

                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                           decoration: BoxDecoration(
                             color: check == index ? Color(0xff3364E0) : Color(0xffF8F7F5),
                             borderRadius: BorderRadius.circular(15)
                           ),
                            child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("${list[index]}",
                          style: TextStyle(
                            color: check == index ? Colors.white : Colors.black,
                            fontSize: 14
                          ),),
                        )),
                      ),
                    );
                  }),
            ),

            ///------------------------- categories list ---------------------
            SizedBox(height: 10,),

            BlocConsumer<CategoriesBloc, CategoriesState>(
              bloc: categoriesBloc,
              listener: (context, state) {
                // TODO: implement listener
              },
              listenWhen:(previous,current) => current is CategoriesActionState ,
              buildWhen:(previous,current) => current is !CategoriesActionState  ,
              builder: (context, state) {

                switch(state.runtimeType){
                  case CategoriesLoadingState:
                    return Center(child: CircularProgressIndicator(),);
                  case CategoriesSuccessState:
                    final data = state as CategoriesSuccessState;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height /1.3,
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 150,
                            ),
                            itemCount: data.categories['dishes'].length,
                            itemBuilder: (ctx,index){
                              return ViewWidget(data: data.categories['dishes'][index],catogoryBloc: categoriesBloc,);
                            }),
                      ),
                    );

                  default :
                    return Center(child: Text("default"),);
                }

              },
            )

          ],
        ),
      ),
    );
  }
}
