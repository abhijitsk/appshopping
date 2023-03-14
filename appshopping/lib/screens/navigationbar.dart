import 'package:appshopping/screens/tabs/categories.dart';
import 'package:appshopping/screens/tabs/homepage.dart';
import 'package:appshopping/screens/tabs/profile.dart';
import 'package:appshopping/screens/tabs/search.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class NavigationOptions extends StatefulWidget{
   NavigationOptions({super.key,this.index = 0});
  int index;

   

 

  
  @override
  State<NavigationOptions> createState() => _NavigationOptionsState();
}

class _NavigationOptionsState extends State<NavigationOptions> {
  int selectedindex = 0;
  @override
  Widget NavOptions(int currentIndex){
    switch(currentIndex){
      case 0:
          return HomePage();
      case 1:
          return SearchPage();
      case 2:
          return CategoriesPage();
      case 3:
          return ProfilePage();

        break;
      default:
          return HomePage();


    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: NavOptions(widget.index),
      bottomNavigationBar: ConvexAppBar(items: const [
        TabItem(title: 'Home',icon: Icons.home_filled),
        TabItem(title: 'Search',icon: Icons.search),
        TabItem(title: 'Categories',icon: Icons.category),
        TabItem(title: 'Profile',icon: Icons.person),
      ],
      onTap: (index){
        setState(() {
          widget.index = index;
        });
      },
      ),

    );
  }
}