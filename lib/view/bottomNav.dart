import 'package:flutter/material.dart';
import 'package:food_app/view/basket/ui/basket.dart';
import 'package:food_app/view/profile/ui/profile.dart';
import 'package:food_app/view/search/ui/search.dart';

import 'home/ui/home.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int current = 0;

  @override
  Widget build(BuildContext context) {

    List pages = [
      Home(),
      Search(),
      Basket(),
      Profile()
    ];
    return Scaffold(

      body: pages[current],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        fixedColor: Color(0xff3364E0),
        onTap: (val){
          setState(() {
            current = val;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: 'Пойск'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined),label: 'Аккаунт'),
        ],
      ),
    );
  }
}
