import 'package:ecommerce/firebase_helpers/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommerce/view/widgets/primaryButton/primaryButton.dart';
import 'package:ecommerce/view/widgets/top_title/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../home/home.dart';
import '../SignUp/Sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitle(title: "Login", subtitle: "Welcome To E-STORE"),
              SizedBox(
                height: kToolbarHeight,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "E-mail",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    )),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: CupertinoButton(
                      child: Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      padding: EdgeInsets.zero,
                    )),
              ),
              SizedBox(
                height: kToolbarHeight,
              ),
              Primarybutton(
                title: "Login",
                onPressed: () async{
                  bool isValidated =  loginValidation(email.text, password.text);
                  if(isValidated) {
                    bool isLogined = await FirebaseAuthHelper.instance.login(email.text, password.text, context);
                    if(isLogined) {
                      // ignore: use_build_context_synchronously
                      Routes.instance.pushAndRemoveUntil(
                          widget: const Home(), context: context
                      );
                    }
                  }
                },
              ),
              const SizedBox(
                height: 14,
              ),
              const Center(
                child: Text("Don't have an account?"),
              ),
              const SizedBox(
                height: 14,
              ),
              Center(
                  child: CupertinoButton(
                      child: const Text("Create an account",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      onPressed: () {
                        Routes.instance.push(widget: SignUp(), context: context);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
