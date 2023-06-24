import 'package:drawing_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:page_transition/page_transition.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController user1 = TextEditingController();

  final TextEditingController pass1 = TextEditingController();

  bool password=false;

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
                  "Enter your details  ",
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
                      controller: user1,
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
                          hintText: "Enter a Username",
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
                    controller: pass1,
                    obscureText: !password,
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
                            password ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              password = !password;
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
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                         prefixIcon: Theme(
                            data: Theme.of(context).copyWith(
                              iconTheme: IconThemeData(
                                  color: Colors
                                      .grey[700]), // Customize the unselected color
                            ),
                            child: Icon(Icons.person_pin_circle_rounded),
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
                        hintText: "Enter Your Age",
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
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      SmartDialog.showLoading(
                        msg: "Signing up..."
                        
                      );

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: user1.text,
                        password: pass1.text,
                      )
                          .then((value) {
                        SmartDialog
                            .dismiss(); // Dismiss the SmartDialog upon successful sign-in
                        Navigator.pushReplacement(
                          context,
                          PageTransition(child: loginpage(), type: PageTransitionType.rightToLeft)
                          //MaterialPageRoute(builder: (context) => loginpage()),
                        );
                      }).catchError((error) {
                        SmartDialog
                            .dismiss(); // Dismiss the SmartDialog if an error occurs
                        // Handle the error (e.g., display an error message)
                        print('Sign-up error: $error');
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
