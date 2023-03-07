import 'package:appshopping/screens/authentication/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appshopping/models/authmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appshopping/models/passwordText.dart';
import 'package:appshopping/models/iconanimation.dart';
//import 'package:rive/rive.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);


  
  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {

  FocusNode myFocusNode = new FocusNode();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  bool elevate = false;
  
  final GlobalKey<FormState> _key= GlobalKey<FormState>();
  

  //===========> Boxdecoration for the containers

  BoxDecoration decoration()=> BoxDecoration(
    color: const Color.fromARGB(255, 224, 215, 211),
    boxShadow: [
      new BoxShadow(
        color: Color.fromARGB(255, 80, 23, 2),
        blurRadius: 12,
        offset: Offset(5,5)
      ),
      BoxShadow(
        color: Color.fromARGB(255, 48, 15, 3),
        blurRadius: 30,
        offset: Offset(5,5)
      )
    ],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.white,
    )
  );

  BoxDecoration decoration1()=> new BoxDecoration(
    color: const Color.fromARGB(255, 224, 215, 211),
    
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.white,
    )
  );

  //===========> input decoration for Textfields

  InputDecoration inputdecoration(String label)=> InputDecoration(
    labelText: label,
    border: InputBorder.none,
  );

  //=============> New Account creation

  Future<String> createaccount(String email, String password) async{
    
    try {
      dynamic authResult =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password:password);
      return 'Account created Successfully';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
     
      
  }
    
  Future createDatabase(AuthModel authModel)async{
    DocumentReference docref =  await FirebaseFirestore.instance.collection('DabaseAccounts').doc(authModel.emailAdd);

    final json = authModel.toJson();
    await docref.set(json);

  }

  @override
  void dispose(){
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
      child:  Scaffold(
        
        backgroundColor: Colors.transparent,
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children:  [
                  const SizedBox(height: 50,),


                   
                        IconAnimation(),
                        
                        // Image.asset(

                        //   'images/icon.png',
                        //   height: MediaQuery.of(context).size.height*0.15,
                        //   width: MediaQuery.of(context).size.width*0.15,
                        //   ),
                      
          
                  // ========================================================================>
          
                      const SizedBox(height: 60,),
                      Container(
                        
                        height: 30,
                        padding: const EdgeInsets.only(left: 0),
                        color: Colors.transparent,
                        child:const  Text(
                          'Enter your email address to sign up    ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          
                          decoration:myFocusNode.hasFocus?  decoration(): decoration1(),
                          height: 40,
                          padding:  const EdgeInsets.only(left: 20),
                          child:   TextFormField(
                           
                            focusNode: myFocusNode,
                            validator: validateEmail,
                            
                            controller: _email,
                            decoration:  const InputDecoration(
                              focusColor: Colors.blue,
                              
                              //hintText: 'Email address',
                              icon: Icon(Icons.email_outlined),
                              border: InputBorder.none),
                            
                            
          
                          ),
          
                        ),
                        ),
          
                // ========================================================================>
          
                      const SizedBox(height: 20,),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 0),
                        color: Colors.transparent,
                        child:const  Text(
                          'Please enter your password here         ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
                      PasswordText(label: 'Password',controller: _password),
                      
                  // ========================================================================>
          
                      const SizedBox(height: 20,),
                  Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 0),
                        color: Colors.transparent,
                        child:const  Text(
                          'Please confirm your password here    ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
                  PasswordText(label: 'Re- type the Password',controller:_confirmpassword),
                  const SizedBox(height: 20,),
                //================================================================================>
                   const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: decoration(),
                      height: 40,
                      width: 170,
                      child:  TextFormField(
                        validator: (value) {
                          if (value!.isEmpty){
                            return 'Enter the last Name';
                          }
                        },
                        controller: firstname,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name'),
                      ),
                    ),
                   const  SizedBox(width: 10,),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: decoration(),
                      height: 40,
                      width: 170,
                      child:  TextFormField(
                        validator: (value) {
                          if (value!.isEmpty){
                            return 'Enter the last Name';
                          }
                        },
                        controller: lastname,
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name'),
                      ),
                    ),
                  ],),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: decoration(),
                      height: 40,
                      width: 120,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Area Code'),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: decoration(),
                      height: 40,
                      width: 220,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Telephone Number'),
                      ),
                    ),
                  ],),
                    
                    
                    const SizedBox(width: 20,),
              //=========================================================================================>
                        
          
                    
                     
              //============================================================================================>
              const SizedBox(height: 20,),
              
            //============================================================================================>
          
            Container(
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 88, 27, 5).withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)
              ),
              child: MaterialButton(
               
                onPressed: ()async{
                  final user = AuthModel(
                    emailAdd: _email.text.trim(), 
                    password: _password.text.trim(), 
                    firstName: firstname.text.trim(), 
                    lastName: lastname.text.trim(), 
                    );

                  if (_key.currentState!.validate()){


                    if (_password.text.trim()==_confirmpassword.text.trim()){
                      
                    var check = await createaccount(_email.text.trim(),_password.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(check)));
                    if (check.toLowerCase()=='account created successfully'){
                      createDatabase(user);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                    }        

                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('make sure password and confirm password are same')));


                  }


                    
                  }

                  
                  
          
                  
                  // create seperate function
                  
                  

                  // create seperate function
                  
                  
                  
                },
                child: const Text('Create Account'),),
            ),

            const SizedBox(height: 20,),
            
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              },
              child: const Text('Have an account? Click here to login')),
          
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
  
  
}

String? validatePassword(String? formPassword){
  if(formPassword==null || formPassword.isEmpty){
    return 'Password is required';
  }
  
  //String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  return null;
}