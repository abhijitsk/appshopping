import 'package:appshopping/models/passwordText.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget{
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState()=> ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword>{
  var _email = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.topCenter,
      decoration:  const BoxDecoration(

          
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 88, 27, 5),
            Color.fromARGB(179, 199, 129, 104),
          ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 70,),
                      
                      Image.asset(
                          'images/icon.png',
                          height: MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width*0.15,
                          ),
                      SizedBox(height: 40,),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 0),
                        color: Colors.transparent,
                        child:const  Text(
                          'Enter your email address to sign in    ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
                      TextEmail(controller: _email),
                      SizedBox(height: 70,),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 99, 50, 9),
                          borderRadius: BorderRadius.circular(12)),
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text('Reset Password'),
                        ),
                      ),
                      
                    ],
                  )),)),
          ),
    );
  }
}