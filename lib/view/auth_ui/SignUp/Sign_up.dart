import 'package:ecommerce/view/widgets/primaryButton/primaryButton.dart';
import 'package:ecommerce/view/widgets/top_title/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../firebase_helpers/firebase_auth_helper/firebase_auth_helper.dart';
import '../../home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController firstName= TextEditingController();
  TextEditingController lastName= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitle(title: "Create Account", subtitle: "Welcome To E-STORE"),
              const SizedBox(
                height: kToolbarHeight,
              ),
              TextFormField(
                controller: firstName,
                decoration: const InputDecoration(
                    hintText: "First Name",
                    prefixIcon: Icon(
                      Icons.person,
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: lastName,
                decoration: const InputDecoration(
                    hintText: "Last Name",
                    prefixIcon: Icon(
                      Icons.person,
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    hintText: "E-mail",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.password_outlined),
                    suffixIcon: CupertinoButton(

                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    )),
              ),
              const SizedBox(
                height: kToolbarHeight,
              ),
              Primarybutton(
                title: "Create Account",
                onPressed: () async{
                  bool isValidated =  signUpValidation(email.text, password.text, firstName.text, lastName.text);
                  if(isValidated) {
                    bool isSignUp = await FirebaseAuthHelper.instance.signUp(email.text, password.text, firstName.text, context);
                    if(isSignUp) {
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
                child: Text("Already have an account?"),
              ),
              const SizedBox(
                height: 14,
              ),
              Center(
                  child: CupertinoButton(
                      child: const Text("Login",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
