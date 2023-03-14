import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HomePage'),
            MaterialButton(
              onPressed: ()async{
                  await FirebaseAuth.instance.signOut()
;              },
              child: Text('Logout'),)
          ],
        ),
      ),
    );
  }
}