import 'package:drawing_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'options.dart';
import 'package:page_transition/page_transition.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController usernameCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  bool pass = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/loginpage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      controller: usernameCon,
                      decoration: InputDecoration(
                          prefixIcon: Theme(
                            data: Theme.of(context).copyWith(
                              iconTheme: IconThemeData(
                                  color: Colors
                                      .grey[700]), // Customize the unselected color
                            ),
                            child: Icon(Icons.person),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Username",
                          fillColor: Colors.grey[400]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: passCon,
                    obscureText: !pass,
                    decoration: InputDecoration(
                         prefixIcon: Theme(
                            data: Theme.of(context).copyWith(
                              iconTheme: IconThemeData(
                                  color: Colors
                                      .grey[700]), // Customize the unselected color
                            ),
                            child: Icon(Icons.lock),
                          ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            
                            pass ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              pass = !pass;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(70),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Password",
                        fillColor: Colors.grey[400]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    child: Text("GO"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      SmartDialog.showLoading(msg: "Signing in...");

                      auth
                          .signInWithEmailAndPassword(
                        email: usernameCon.text,
                        password: passCon.text,
                      )
                          .then((value) {
                        SmartDialog
                            .dismiss(); // Dismiss the SmartDialog upon successful sign-in
                        Navigator.pushReplacement(
                          context,
                          PageTransition(child:options() ,type: PageTransitionType.rightToLeft)
                          //MaterialPageRoute(builder: (context) => options()),
                        );
                      }).catchError((error) {
                        SmartDialog
                            .dismiss(); // Dismiss the SmartDialog if an error occurs
                        // Handle the error (e.g., display an error message)
                        print('Sign-in error: $error');
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signup(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
