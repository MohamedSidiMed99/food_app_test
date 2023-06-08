import 'package:flutter/material.dart';

import '../../../custom_widgets/header_custom_widget.dart';
import '../view_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key,this.data,this.homebloc}) : super(key: key);
  final data;
  final homebloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            shrinkWrap: true,
            children: [
              ///--------------header ----------------
              HeaderCustom(),

              SizedBox(height: 10,),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (ctx,index){
                  return ViewData(data: data[index],homebloc: homebloc,);

                },
              ),
            ])
    );
  }
}