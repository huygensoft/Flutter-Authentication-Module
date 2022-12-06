import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_authentication/google_auth.dart';
import 'package:sign_in_authentication/signup.dart';
import 'package:sizer/sizer.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
   return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(), 
     child: Sizer(
      builder: (context, orientation, deviceType) {
    return MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
      }
   ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
            ),
            TextButton(onPressed: () {
              signIn(emailController.text, passwordController.text);
            }
            , child: Container(
              height: 8.h,
              width: 40.w,
            ))
          ],
        ),
      ),
    );
  }
}

Future signIn(String email, String password) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value) {});
}
