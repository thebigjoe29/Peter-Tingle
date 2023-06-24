import 'package:flutter/material.dart';

class learn extends StatelessWidget {
  const learn({Key? key}) : super(key: key);

  // Widget shape(String text, Color clr) {
  //   SizedBox(
  //     width: 100,
  //     height: 300,
  //     child: FloatingActionButton(
  //       backgroundColor: clr,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //           fontFamily: 'DiyaFont',
  //           fontSize: 30,
  //         ),
  //       ),
  //       onPressed: () {},
  //     ),
  //   );
  // }

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
                    image: AssetImage('images/learnpage.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            // SizedBox(
            //   height: 300,
            // ),
            ListView(
              padding: EdgeInsets.all(30),
              children: [
                SizedBox(
                  height: 150,
                ),
                // shape("hello", clr)
                SizedBox(
                  width: 100,
                  height: 300,
                  child: FloatingActionButton(
                    backgroundColor: Colors.teal[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Triangle",
                      style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 320,
                  height: 300,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Circle",
                      style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 300,
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Square",
                      style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 300,
                  child: FloatingActionButton(
                    backgroundColor: Colors.green[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Oval",
                      style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 300,
                  child: FloatingActionButton(
                    backgroundColor: Colors.orange[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Rectangle",
                      style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 300,
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey[500],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Parallelogram",
                      style: TextStyle(
                        fontFamily: 'Font2',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
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
