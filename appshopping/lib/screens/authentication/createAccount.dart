import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget{
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState()=>CreateAccountState();
}

class CreateAccountState extends State<CreateAccount>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(child: Text('Poda Patty')),
    );

  }
}