import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Background extends StatelessWidget{
  const Background({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: const Color.fromARGB(249, 117, 45, 4),
      body:  Stack(
        children:  [
         const  RiveAnimation.asset('images/background.riv',
        fit: BoxFit.fill,),
          Positioned.fill(
            child: BackdropFilter(
              child: SizedBox(),

              filter: ImageFilter.blur(sigmaX: 20,sigmaY: 20),
            )),
        ],
      )
    );
  }
}