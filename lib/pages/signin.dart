import 'package:QuickTapChat/pages/forgotpassword.dart';
import 'package:QuickTapChat/pages/home.dart';
import 'package:QuickTapChat/pages/signup.dart';
import 'package:QuickTapChat/services/database.dart';
import 'package:QuickTapChat/services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "", password = "", name = "", pic = "", username = "", id = "";
  TextEditingController usermailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserbyMail(email);
      name = "${querySnapshot.docs[0]["Name"]}";
      username = "${querySnapshot.docs[0]["username"]}";
      pic = "${querySnapshot.docs[0]["Photo"]}";
      id = querySnapshot.docs[0].id;

      await SharedPreferHelper().saveUserDisplayName(name);
      await SharedPreferHelper().saveUserName(username);
      await SharedPreferHelper().saveUserId(id);
      await SharedPreferHelper().saveUserPic(pic);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No user found on this Email",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong password provided by user",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 240, 174, 33),
                    Color(0xFF6380fb)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 105))),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 70)),
                Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Login into your Account",
                  style: TextStyle(
                    color: Color.fromARGB(255, 209, 218, 223),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: usermailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.mail_outline,
                                        color: Color(0xFF7f30fe),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: userpasswordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Color(0xFF7f30fe),
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPass()));
                                  }
                                  
                                  ,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email=usermailcontroller.text;
                                      password=userpasswordcontroller.text;
                                    });
                                  }
                                  userlogin();
                                },
                                child: Center(
                                  child: Container(
                                    width: 120,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 5,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF6380fb),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text("SignIn",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                      },
                      child: Text(" Sign Up Now!",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7f30fe))),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
