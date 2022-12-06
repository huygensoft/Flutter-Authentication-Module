// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, must_be_immutable, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_authentication/button.dart';
import 'package:sign_in_authentication/google_auth.dart';
import 'package:sign_in_authentication/hello.dart';



class SignUpPage extends StatefulWidget {
  bool obscureTrigger = true;

  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? firstnameController;
  TextEditingController? lastnameController;
  EmailAuth? emailAuth;

  Future<bool> sendOtp() async {
    return await emailAuth!
        .sendOtp(recipientMail: _emailController!.value.text, otpLength: 5);
  }

  //Username? uname;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    //uname = Username();


    emailAuth = EmailAuth(
      sessionName: "Sign in app",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
          SizedBox(height:70),
            Row(
              children: [
              SizedBox(width:10),
                Text(
                  'Let’s help you',
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF000000)),
                ),
              ],
            ),
            Row(
              children: [
               SizedBox(width:10),
                Text(
                  'Sign In with Ease',
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFF00000)),
                ),
              ],
            ),
           SizedBox(height:60),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: firstnameController,
                              decoration: InputDecoration(
                                hintText: ' First name',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0XFFFE64336))),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please fill in blank fields';
                                } else if (value.isNotEmpty &&
                                    value.length <= 2) {
                                  return 'Name should have a minimum of 3 characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 8,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: lastnameController,
                              decoration: InputDecoration(
                                hintText: ' Last name',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0XFFFE64336))),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please fill in blank fields';
                                } else if (value.isNotEmpty &&
                                    value.length <= 2) {
                                  return 'Name should have a minimum of 3 characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFFFE64336))),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          validator: (String? data) {
                            if (data!.isEmpty) {
                              return 'Please fill in blank field';
                            } else if (data.isNotEmpty && !data.contains('@')) {
                              return 'Oops, that does\'nt seem right';
                            } else {
                              return null;
                            }
                          }),
                    ),
                       SizedBox(height:10),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                          obscureText: widget.obscureTrigger,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            suffixIcon: Column(
                              children: [
                               SizedBox(height:20),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.obscureTrigger =
                                            !widget.obscureTrigger;
                                      });
                                    },
                                    child: Text(
                                      widget.obscureTrigger ? "Show" : "Hide",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ],
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFFFE64336))),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          validator: (String? data) {
                            if (data!.isEmpty) {
                              return 'Please fill in blank field';
                            } else if (data.isNotEmpty && data.length < 6 ||
                                data.length > 15) {
                              return 'Character count between 6 - 15 characters';
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                signup();
                
              },
              child: Text('Sign Up',
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                elevation: 1, backgroundColor: Color(0XFFFE64336),
                fixedSize: const Size(350, 60),
                shape: StadiumBorder(),
              ),
            ),
         SizedBox(height:20),
            Stack(
              children: [
                Positioned(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
               
              ],
            ),
           SizedBox(height:20),
            SignupButton(
              text: 'Signup with Google',
              onPressed: () async {
                Provider.of<GoogleSignInProvider>(context, listen: false)
                    .googleLogin();
             
              },
            ),
          
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                  
                    },
                    child: Text(
                      " Sign In",
                      style: TextStyle(
                          fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  Future signup() async {
    bool isLogged = true;

    // String e = Navigator.pop(context);
    // if (e == null) {
    //   debugPrint();
    // } else {
    //   ScaffoldMessenger.of(context)
    //     ..clearSnackBars()
    //     ..showSnackBar(SnackBar(content: Text(e), backgroundColor: Colors.red));
    // }
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController!.text.trim(),
          password: _passwordController!.value.text.trim());
      Navigator.popUntil(context, (route) => route.isActive);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
            SnackBar(content: Text(e.message!), backgroundColor: Colors.red));
      setState(() {
        isLogged = false;
      });
      Navigator.pop(context);
    }

    if (isLogged) {
      sendOtp();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HelloPage()));
    }
  }
}



