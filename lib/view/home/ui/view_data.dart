import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';


class ViewData extends StatelessWidget {
  const ViewData({Key? key,this.data,this.homebloc}) : super(key: key);
  final data;
  final homebloc;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
            homebloc.add(GoToCategoriesEvent());
        },
        child: SizedBox(
          width: double.maxFinite,
          height: 150,
          child: Stack(
            children: [

              SizedBox(
                height: 150,
                width: double.maxFinite,
                child: Image.network("${data['image_url']}",fit: BoxFit.cover,),
              ),
             Container(
               height: 150,
               width: 150,
               margin: EdgeInsets.only(left: 10,top: 20),
               child: Text("${data['name']}",
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                     fontWeight: FontWeight.w700
                 ),),
             )
            ],
          ),
        ),
      ),
    );
  }
}
