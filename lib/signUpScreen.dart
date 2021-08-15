import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/signUpScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final picker = ImagePicker();
  var _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('SignUp')),
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
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: mobileController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile Number',
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
                SizedBox(height: 20,),
                InkWell(
                onTap: () {
                  callDialog();
                },
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              border: Border.all(color: Color(0xff0C4A77))),
                          child: _image == null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://s3images.zee5.com/wp-content/uploads/sites/7/2021/03/ranbir-kapoor-784x441.jpg'),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('SignUp', style: TextStyle(fontSize: 20),),
                      onPressed: () {
                        if(validation()){
                          print(nameController.text);
                        print(passwordController.text);
                        Navigator.pop(context);
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
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
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
    if(nameController.text.length == 0 ){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Name")));
      return false;
    }
    else if(!regPass.hasMatch(emailController.text)){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Valid Email")));
      return false;
    }
    if(mobileController.text.length == 0 ){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Mobile Number")));
      return false;
    }
    else if(passwordController.text.length < 8){
    ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password length should be greater than 8")));
    return false;
    }
    else if(_image == null){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Select Profile Image")));
      return false;
    
    }
    else return true;
    }

  callDialog(){
    return showDialog(
            context: context,
            builder: (BuildContext context) {  
            return AlertDialog(
                actions: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    InkWell(child: Container(padding : EdgeInsets.all(10), child: Text("Camera", style: TextStyle(fontSize: 15),)),onTap: (){Navigator.pop(context); getImage();},),
                    InkWell(child: Container(padding : EdgeInsets.all(5), child: Text("Gallery",style: TextStyle(fontSize: 15),)),onTap: (){Navigator.pop(context); getImageGallery();},),
                  ],),
                )
              ],
            );
            },
        );
  }
   Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}