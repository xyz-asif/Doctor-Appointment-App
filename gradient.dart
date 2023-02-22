import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: ContainerStyle(),
    );
  }
}

class ContainerStyle extends StatelessWidget {
  final String now = DateFormat('dd-MM-yyyy').format(DateTime.now());
 var next = DateTime.now().add(Duration(days:1));
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beautiful Linear Background"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [ Container(
                  child: Stack(children: [
                    Positioned(top: 15,
                    left: 15,
                      child: Text(DateFormat('EEEE').format(next).toUpperCase(), style: GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 5,fontWeight: FontWeight.w600),
  ),),),
                      Positioned(top: 38,
                    left: 15,
                      child: Text(now.toString(),style: TextStyle(color: Colors.black38),)),
                       Positioned(bottom: 5,
                    right: 15,
                      child: Text("10 - 11", style: GoogleFonts.limelight(
    textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 35),
  ),)),
                  ]),
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
                    Color.fromRGBO(134, 142, 214, 1),
                    Color.fromRGBO(134, 142, 214, 1),
                   Color.fromRGBO(134, 142, 214, 1),
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
           
            Positioned(
              bottom: -25,
              left: -55,
              child: Container(
                child:  Lottie.network("https://assets6.lottiefiles.com/packages/lf20_ot5gqdfc.json"),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(37, 171, 201, 1),
                        Color.fromARGB(255, 247, 246, 246),
                      ],
              
                      begin: Alignment.topRight, //begin of the gradient color
              
                      end: Alignment.bottomCenter,
                    )
              
                    //more than 50% of width makes circle
              
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
