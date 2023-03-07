import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class PasswordText extends StatefulWidget{
  String label;
  var controller = TextEditingController();
  PasswordText({Key? key, required this.label, required this.controller, }) : super(key: key);


  State<PasswordText> createState()=> PassTextState();

}

class PassTextState extends State<PasswordText>{
  bool obstext = true;
  @override

  Widget build (BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 450),
        padding: const EdgeInsets.only(left: 20),
        height:40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 215, 211),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
        color: Colors.white,
      )),
      child: TextFormField(
        
        validator: validatePassword,
        controller: widget.controller,
        obscureText: obstext,
        decoration: InputDecoration(
          suffixIcon: IconButton(icon: const Icon(Icons.remove_red_eye),onPressed: (){
            setState(() {
              obstext = !obstext;
            });
          }),
          icon: const Icon(Icons.password,color: Color.fromARGB(255, 71, 38, 26),),
          border: InputBorder.none,
        ),
      ),
      ),
    ).animate().fade().slide().shake();
  }
}

//class email address
//=============================================================================>
class TextEmail extends StatefulWidget{
  var controller = TextEditingController();
   TextEmail({Key? key, required this.controller}) : super(key: key);

  @override
  TextEmailState createState()=> TextEmailState();
}

class TextEmailState extends State<TextEmail>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        padding: const EdgeInsets.only(left:20),
        height:40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.brown,
            blurRadius:30 ,
            offset: Offset(5,5))
          ],
          color: const Color.fromARGB(255, 224, 215, 211),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
        color: Colors.white,
      )),
      child: TextFormField(
        validator: validateEmail,
        controller: widget.controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.email_outlined,color: Color.fromARGB(255, 71, 38, 26)),
          border: InputBorder.none,
        fillColor: Colors.white),
      ),

      ),) ;
  }
}

String? validateEmail(String? formEmail){
  
  if(formEmail==null || formEmail.isEmpty){
    return 'Email address is required';
    
  }
    String pattern =r'\w+@\w+\.\w' ;
    RegExp regex = RegExp(pattern);
    if(!regex.hasMatch(formEmail)){
      return 'Invalid Email format';
    }
  return 'lets see';
  
}

String? validatePassword(String? formPassword){
  if(formPassword==null || formPassword.isEmpty){
    return 'Password is required';
  }
  
  //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  return null;
}