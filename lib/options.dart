import 'package:drawing_app/draw.dart';
import 'package:drawing_app/learn.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class options extends StatelessWidget {
  const options({Key? key}) : super(key: key);

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
                  image: AssetImage('images/optionspage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 250,
                    child: FloatingActionButton(
                      backgroundColor: Colors.teal[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "L e a r n",
                        style: TextStyle(
                          fontFamily: 'Font2',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(child: learn(), type: PageTransitionType.rightToLeft)
                         // MaterialPageRoute(
                              //builder: (context) => const learn()),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 250,
                    child: FloatingActionButton(
                      backgroundColor: Colors.teal[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "T e s t",
                        style: TextStyle(
                          fontFamily: 'Font2',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(child: DrawingBoard(), type: PageTransitionType.rightToLeft,),
                          // MaterialPageRoute(
                          //     builder: (context) => DrawingBoard()),
                        );
                      },
                    ),
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
