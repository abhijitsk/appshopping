import 'package:rive/rive.dart';
import 'package:flutter/material.dart';


class IconAnimation extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return   Container(
      height: 150,
      width: 180,
      child: const RiveAnimation.asset('images/icons.riv'),
    );
  }
}