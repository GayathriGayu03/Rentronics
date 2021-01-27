import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rentronics/AddProduct.dart';
import 'package:rentronics/userdashboard.dart';


class sign extends StatefulWidget {
  @override
  _signState createState() => _signState();
}
class _signState extends State<sign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: signinpage(),
      ),
    );
  }
}

final mAuth=FirebaseAuth.instance;
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}
class _signupState extends State<signup> {

    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    bool _obscureText=true;
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context)
          .size
          .width;
      double height = MediaQuery
          .of(context)
          .size
          .width;
      return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.orange[900],
                    Colors.orange[800],
                    Colors.orange[400]
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Signup",
                      style: TextStyle(color: Colors.white, fontSize: 40),),
                    SizedBox(height: 10,),
                    Text("Welcome To Home Rentronics",
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 60,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)
                                  )
                                  ]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                      controller: emailController,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextField(
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                      controller: passwordController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40,),
                            Container(

                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: RaisedButton(
                                color: Colors.orange[900],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                ),
                                child: Text("SignUp", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                                onPressed: () async {
                                  await Firebase.initializeApp();
                                  UserCredential muser;
                                  muser =
                                  await mAuth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                                },
                              ),

                            ),
                        SizedBox(height: 40,),
                        Container(

                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: RaisedButton(
                            color: Colors.orange[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            ),
                            child: Text("Sign In", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>signinpage()));
                            },
                          ),
                        ),
                          ],
                        )
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    }
  }

class signinpage extends StatefulWidget {
  @override
  _signinpageState createState() => _signinpageState();
}
class _signinpageState extends State<signinpage> {
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  bool _obscureText=true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email or Phone number",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: emailController,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    obscureText:_obscureText,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: passwordController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:RaisedButton(
                                color: Colors.orange[900],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                ),
                                child: Text("Signin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                onPressed: ()
                                async {
                                  await Firebase.initializeApp();
                                  UserCredential muser = await mAuth
                                      .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => productupload(user: muser,)));


                                }

                            ),

                          ),
                          SizedBox(height: 40,),
                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: RaisedButton(
                              color: Colors.orange[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)
                              ),
                              child: Text("Sign Up", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}






