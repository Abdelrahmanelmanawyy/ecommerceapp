import 'package:flutter/material.dart';
import 'package:ecommerce_app/Component/my_button.dart';
import 'package:ecommerce_app/Component/my_textfilled.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_Page extends StatefulWidget {
  final Function()? ontap;
  Login_Page({super.key, required this.ontap});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
   void displayMessage(String message) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(message),
              ));
    }

  void SignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      displayMessage(e.code);
    }
   
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.store,
                size: 130,
              ),
              const SizedBox(
                height: 20,
              ),
              // hello
              const Text(
                'Hello again',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),

              // email textfiled

              MyTextFiled(
                controller: emailcontroller,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password text filed

              MyTextFiled(
                controller: passwordcontroller,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //sign in button

              MyButton(
                onTap: SignIn,
                text: "Sign in",
              ),

              const SizedBox(
                height: 10,
              ),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'not a member? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: widget.ontap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '  Change Password',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
