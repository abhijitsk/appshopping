import 'package:appshopping/screens/tabs/categories.dart';
import 'package:appshopping/screens/tabs/homepage.dart';
import 'package:appshopping/screens/tabs/profile.dart';
import 'package:appshopping/screens/tabs/search.dart';
import 'package:flutter/material.dart';


class NavigationBar extends StatefulWidget{
   NavigationBar({super.key,this.index = 0});
  int index;

   

 

  
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedindex = 0;
  @override
  Widget NavOptions(int currentIndex){
    switch(currentIndex){
      case 0:
          return HomePage();
      case 1:
          return CategoriesPage();
      case 2:
          return ProfilePage();
      case 3:
          return SearchPage();

        break;
      default:
          return HomePage();


    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: NavOptions(selectedindex),
      
    );
  }
}