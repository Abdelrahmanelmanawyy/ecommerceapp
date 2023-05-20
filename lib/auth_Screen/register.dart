import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Component/my_button.dart';
import '../Component/my_textfilled.dart';

class Register_Page extends StatefulWidget {
  final Function()? ontap;
  const Register_Page({super.key, required this.ontap});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPassword = TextEditingController();
  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  void SignUp() async {
    showDialog(
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ));

    if (passwordcontroller.text != confirmPassword.text) {
      Navigator.pop(context);
      displayMessage("password dont match");
      return;
    }
    //try creating user
    try {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text);

       if (context.mounted) Navigator.pop(context);
      
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  @override
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
                'Create account',
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
              //confirm password text filed
              MyTextFiled(
                controller: confirmPassword,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //sign up button

              MyButton(
                onTap: SignUp,
                text: "Sign up",
              ),

              const SizedBox(
                height: 10,
              ),
              TextButton(
                  child: const Text(
                    'Log in Now',
                    style: TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                  onPressed: widget.ontap),
            ],
          ),
        ),
      ),
    );
  }
}
