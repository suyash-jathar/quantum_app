// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_final_fields, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quantum_it_application_1/screens/home.dart';
import '../services/google_sigin.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _agreeToTerms = false;
  String _selectedPrefix = "+91";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _nameLoginController = TextEditingController();
  TextEditingController _emailLoginController = TextEditingController();
  TextEditingController _phoneLoginController = TextEditingController();
  TextEditingController _passwordLoginController = TextEditingController();
  TextEditingController _emailSigninController = TextEditingController();
  TextEditingController _passwordSiginController = TextEditingController();
  String email = '';
  String password = '';

  TabController? _tabController;

  final invalidSnackBar = SnackBar(
    content: Text('Invalid Sign IN Credientials'),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  final registerErrorSnackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        Text('  Complete all Fields to Register...'),
      ],
    ),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  final loginSuccessSnackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        Text(' You are Successfully Signed In .'),
      ],
    ),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: RichText(
            text: TextSpan(
              text: 'Social ',
              style: TextStyle(color: Colors.white, fontSize: 22),
              children: [
                TextSpan(
                  text: 'X',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.064,
                  color: Colors.grey,
                ),
                Container(
                  width: width,
                  height: height * 0.064,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Login"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign Up"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Log IN
                  Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        color: Colors.grey,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.all(45),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Create an Account",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text("Name"),
                              TextField(
                                controller: _nameLoginController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "Enter name",
                                  suffixIcon:
                                      Icon(Icons.person, color: Colors.red),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("Email"),
                              TextField(
                                controller: _emailLoginController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter email",
                                  suffixIcon:
                                      Icon(Icons.email, color: Colors.red),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("Contact Number"),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/logo/indian_flag.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 5),
                                  Text("IN"),
                                  SizedBox(width: 5),
                                  DropdownButton<String>(
                                    value: _selectedPrefix,
                                    items: [
                                      DropdownMenuItem(
                                          value: "+91",
                                          child: Text("+91"),),
                                      DropdownMenuItem(
                                          value: "+06",
                                          child: Text("+06"),),
                                      DropdownMenuItem(
                                          value: "+14",
                                          child: Text("+14"),),
                                      DropdownMenuItem(
                                          value: "+87",
                                          child: Text("+87"),),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedPrefix = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneLoginController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: "Enter number",
                                        prefixIcon: Icon(Icons.phone,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text("Password"),
                              TextField(
                                obscureText: true,
                                controller: _passwordLoginController,
                                decoration: InputDecoration(
                                  hintText: "Enter password",
                                  suffixIcon: Icon(Icons.lock_outline_rounded,
                                      color: Colors.red),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    value: _agreeToTerms,
                                    activeColor: Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        _agreeToTerms = value!;
                                      });
                                    },
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'I agree with ',
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text: 'terms & condition',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontWeight: FontWeight.w600))
                                        ]),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: 'Already have an Account ? ',
                                        style: TextStyle(color: Colors.grey),
                                        children: [
                                          TextSpan(
                                              text: 'Sign In!',
                                              style:
                                                  TextStyle(color: Colors.red))
                                        ]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            if (_agreeToTerms != true &&
                                _nameLoginController.text == '' &&
                                _emailLoginController.text == ''&&
                                _phoneLoginController.text == ''&&
                                _passwordLoginController.text == '') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(registerErrorSnackBar);
                            } else {
                              email=_emailLoginController.text;
                              password=_passwordLoginController.text;
                              _nameLoginController.clear();
                              _emailLoginController.clear();
                              _phoneLoginController.clear();
                              _passwordLoginController.clear();
                              _tabController!.animateTo(1);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Sign IN
                  Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        color: Colors.grey,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.all(45),
                          height: height * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          alignment: Alignment.center,
                     
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SignIn into your Account ",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              Text("Email"),
                              TextField(
                                controller: _emailSigninController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter email",
                                  suffixIcon:
                                      Icon(Icons.email, color: Colors.red),
                                ),
                              ),

                              SizedBox(height: 20),
                              Text("Password"),
                              TextField(
                                controller: _passwordSiginController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter password",
                                  suffixIcon: Icon(Icons.lock_outline_rounded,
                                      color: Colors.red),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password ?',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login with',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await signInWithGoogle();
                                        final User? currentUser =
                                            _auth.currentUser;
                                        print(currentUser);
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Image.asset(
                                          'assets/icons/google_icon.jpg',  
                                          width: 33,
                                          height: 33,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.blue)),
                                      child: Image.asset(
                                        'assets/icons/facebook_icon.jpg', 
                                        width: 33,
                                        height: 33,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    _tabController!.animateTo(0);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don't have an Account ?  ",
                                      style: TextStyle(color: Colors.grey),
                                      children: [
                                        TextSpan(
                                            text: 'Register Now',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            print(email);
                            print(password);
                            print(_emailSigninController.text);
                            print(_passwordSiginController.text);

                            if (email ==
                                    _emailSigninController.text &&
                                password ==
                                    _passwordSiginController.text) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(invalidSnackBar);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
