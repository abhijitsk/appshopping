import 'package:appshopping/screens/authentication/loginpage.dart';
import 'package:appshopping/screens/authentication/signup.dart';
import 'package:appshopping/screens/tabs/homepage.dart';
import 'package:appshopping/screens/tabs/search.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appshopping/screens/navigationbar.dart';

class LoginRoute extends StatelessWidget{
  const LoginRoute({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return NavigationOptions();
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
}