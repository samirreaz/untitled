import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/animated_container.dart';
import 'package:untitled/tarnsform_screen.dart';
import 'package:untitled/text_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AuthApp());
}

class AuthApp extends StatefulWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('Auth User (Logged ' + (user == null ? 'out' : 'in') + ')'),
        ),
        body: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                validator: validateEmail,
                controller: emailController,
              ),
              TextFormField(
                validator: validatePassowrd,
                //keyboardType: TextInputType.number,
                controller: passwordController,
                //obscureText: true,
              ),
              Center(
                child: Text(errorMessage),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: user != null
                          ? null
                          : () async {
                              if (_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  errorMessage = '';
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() {});
                              }
                            },
                      child: Text('Sign Up')),
                  ElevatedButton(
                      onPressed: user != null
                          ? null
                          : () async {
                              if (_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  errorMessage = '';
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                              }
                              setState(() {});
                            },
                      child: Text('Sign In')),
                  ElevatedButton(
                      onPressed: user == null
                          ? null
                          : () async {
                              try {
                                await FirebaseAuth.instance.signOut();
                              } on FirebaseAuthException catch (error) {
                                errorMessage = error.message!;
                              }
                              setState(() {});
                            },
                      child: Text('Log out')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == Null || formEmail!.isEmpty) {
    return 'E-mail address is required.';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
  return null;
}

String? validatePassowrd(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is requied';
  }

/*   String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
    Password must be at least 8 characters,
    include an upercase latter, number and symble.
    ''';
  } */

  return null;
}
