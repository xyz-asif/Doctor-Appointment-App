import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Slot extends StatefulWidget {
  const Slot({Key? key}) : super(key: key);

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [ Container(
              margin: EdgeInsets.all(20),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(170, 204, 180, 1),
                    Color.fromRGBO(170, 204, 180, 1),
                    Color.fromRGBO(170, 204, 180, 1),
                    Color.fromARGB(255, 226, 226, 226),
                    //add more colors for gradient
                  ],
                  begin: Alignment.topLeft, //begin of the gradient color
                  end: Alignment.bottomRight, //end of the gradient color
                  //stops for individual color
                  //set the stops number equal to numbers of color
                ),

                borderRadius: BorderRadius.circular(20), //border corner radius
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(88, 186, 180, 1),
                    Color.fromRGBO(88, 186, 180, 1),
                    Color.fromRGBO(88, 186, 180, 1),
                    Color.fromARGB(255, 224, 221, 221),
                    //add more colors for gradient
                  ],
                  begin: Alignment.topLeft, //begin of the gradient color
                  end: Alignment.bottomRight, //end of the gradient color
                  //stops for individual color
                  //set the stops number equal to numbers of color
                ),

                borderRadius: BorderRadius.circular(20), //border corner radius
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(187, 170, 204, 1),
                    Color.fromRGBO(187, 170, 204, 1),
                    Color.fromRGBO(187, 170, 204, 1),
                    Color.fromARGB(255, 224, 221, 221),
                    //add more colors for gradient
                  ],
                  begin: Alignment.topLeft, //begin of the gradient color
                  end: Alignment.bottomRight, //end of the gradient color
                  //stops for individual color
                  //set the stops number equal to numbers of color
                ),

                borderRadius: BorderRadius.circular(20), //border corner radius
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(178, 134, 115, 1),
                    Color.fromRGBO(178, 134, 115, 1),
                    Color.fromRGBO(178, 134, 115, 1),
                    Color.fromARGB(255, 224, 221, 221),
                    //add more colors for gradient
                  ],
                  begin: Alignment.topLeft, //begin of the gradient color
                  end: Alignment.bottomRight, //end of the gradient color
                  //stops for individual color
                  //set the stops number equal to numbers of color
                ),

                borderRadius: BorderRadius.circular(20), //border corner radius
              ),
            ),],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}