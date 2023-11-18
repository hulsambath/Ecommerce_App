import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/view/auth_ui/login/login.dart';
import 'package:ecommerce/view/widgets/primaryButton/primaryButton.dart';
import 'package:ecommerce/view/widgets/top_title/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SignUp/Sign_up.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitle(title: "Welcome", subtitle: "Digital Accesories Store"),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/logo/logo.png',
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Primarybutton(
                onPressed: () {
                  Routes.instance.push(widget: const Login(), context: context);
                },
                title: "Login",
              ),
              SizedBox(
                height: 12,
              ),
              Primarybutton(
                onPressed: () {
                  Routes.instance.push(widget: const SignUp(), context: context);
                },
                title: "Sign Up",
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.facebook,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/013/948/549/original/google-logo-on-transparent-white-background-free-vector.jpg',
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
