import 'package:appshopping/screens/authentication/resetpassword.dart';
import 'package:appshopping/screens/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:appshopping/models/passwordText.dart';
import 'package:appshopping/models/iconanimation.dart';

class LoginPage extends StatefulWidget{

   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _password = TextEditingController();

  final _email = TextEditingController();
  final GlobalKey<FormState> _key= GlobalKey<FormState>();

  void dispose(){
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 88, 27, 5),
          Color.fromARGB(179, 199, 129, 104),
        ])
      ),
      child:  Form(
        key:_key,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  
                  children: [
                    const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                    IconAnimation(),


                    // Image.asset(
                    //           'images/icon.png',
                    //           height: MediaQuery.of(context).size.height*0.15,
                    //           width: MediaQuery.of(context).size.width*0.15,
                    //           ),
                     const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                   
                    const SizedBox(height: 20,),
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
                    const SizedBox(height: 20,),
                    Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 0),
                        color: Colors.transparent,
                        child:const  Text(
                          'Please enter your password here         ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
                    PasswordText(label: 'Enter your password here', controller: _password),
                   const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                    const SizedBox(height: 20,),
                   
                   Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
      
                      color: Colors.brown),
                    child: MaterialButton(onPressed: (){
                      if(_key.currentState!.validate()){

                        
                        
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
                      }
                    },child: const Center(child: Text('Login')),)),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassword()));
                      },
                      child: const Text('Cant remember the password. Click here to reset'),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                      },
                      child: const Text('Dont have an account to login. Click here to create one'),
                    ),
                  ],

      
                ),
              ))),
        ),
      ),
    );
  }
}