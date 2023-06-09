import 'package:flutter/material.dart';
import 'package:tutorials/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
      setState(() {
      changeButton = true;
      });
      await Future.delayed( const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
      changeButton = false;
    });
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/login_img.png",
              fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0,),
               Text("Welcome $name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height: 20.0,),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child:  Column(children: [
                TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter username",
                  labelText: "Username",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "username cannot be empty";
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
                  setState(() {
                    
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter password",
                  labelText: "Password",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "password cannot be empty";
                  }
                  else if(value.length < 6){
                    return "password length should be atleast 6";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40.0,),
              Material(
                // ignore: deprecated_member_use
                color: context.theme.buttonColor,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changeButton
                    ? const Icon(Icons.done,
                    color: Colors.white,
                    )
                    : const Text(
                      "Login",
                      style: TextStyle(
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
              //   child: const Text("Login"),
              //   )
              ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}