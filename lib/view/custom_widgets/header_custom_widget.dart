import 'package:flutter/material.dart';


class HeaderCustom extends StatelessWidget {
  const HeaderCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [

              Icon(Icons.location_on_outlined, size: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text("Санкт-Петербург",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),),
                  Text("12 Августа, 2023",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5)

                    ),),

                ],
              ),


            ],
          ),

          Row(
            children: [
              CircleAvatar(
                radius: 25,
                foregroundImage: AssetImage("images/profile.jpeg"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
