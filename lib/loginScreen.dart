import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sample/homeScreen.dart';
import 'package:sample/secondScreen.dart';
import 'package:sample/signUpScreen.dart';
import 'dart:io';
import 'dataGetModal.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login')),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Welcome Folks',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 150,
                      height: 40,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      child: Text('Forgot Password ?')),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        if(validation()){
                          var box = await Hive.openBox('testBox');
                        var person = {
                          "name" : nameController.text.toString(),
                          "pass" : passwordController.text.toString()
                          };
                        await box.put('dave', person);
                        print("box.get(person)${box.values}");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                        print(nameController.text);
                        print(passwordController.text);
                        }
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text(
                        'SignUp',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }

    bool validation() {
    var reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var passPattern = '@';

    RegExp regPass = new RegExp(passPattern);
    if(!regPass.hasMatch(nameController.text)){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Valid Email")));
      return false;
    }
    else if(passwordController.text.length < 8){
    ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password length should be greater than 8")));
    return false;
    }
    else return true;
    }
}
