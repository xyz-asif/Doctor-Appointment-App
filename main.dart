// ignore_for_file: non_constant_identifier_names
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospetal/p.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Next(),
  ));
}

DateTime today =
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

class Hos extends StatefulWidget {
  const Hos({Key? key}) : super(key: key);

  @override
  State<Hos> createState() => _HosState();
}

class _HosState extends State<Hos> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final snackBar = const SnackBar(
    content: Text('Reached the limit!'),
  );

  final _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
// todo give collectiuon here
    await Appointment.add(name.text, number.text);
// todo give collectiuon here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Next()),
    );

    print("success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        bottomNavigationBar : Stack(
          children: [
Positioned(
bottom: -50, 
left: -30, 
  child:     Container(
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
                         child: 
                           
                          Lottie.network("https://assets6.lottiefiles.com/packages/lf20_ot5gqdfc.json"),
                         
                       )),Positioned(
              left: 25.0,
              right: 25.0,
              top: 20.0,
              bottom: 0.0,
              child:  Column(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             
          Image.asset("assets/p.png"),
           Padding(
             padding: const EdgeInsets.only(top:15.0),
             child: TextField(

      controller: name,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.cyan),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                   ),  
      labelText: 'Name :',labelStyle: TextStyle(color: Colors.black45),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
                  )      ),
           ),
    
        
         Padding(
           padding: const EdgeInsets.only(top:15.0),
  
           child: TextField(
            
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: number,
      decoration: InputDecoration(
           enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.cyan),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                   ),  
      labelText: 'Number :',labelStyle: TextStyle(color: Colors.black45),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
                  )      ),
         ),
        
        Padding(
           padding: const EdgeInsets.only(top: 35),
          child: Container(
            
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(37, 171, 201, 1),
                      Color.fromARGB(255, 247, 246, 246),
                    ],
            
                    begin: Alignment.topLeft, //begin of the gradient color
            
                    end: Alignment.bottomRight,
                  )
            ),
              child: TextButton(
            child:  Text("GET",
  style: GoogleFonts.poppins(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 0.5,fontWeight: FontWeight.bold),
  ),),
            onPressed: () async {
              var options = {
                'key': 'rzp_test_klRXFR55I5q4MN',
                'amount': 50000,
                'name': 'Asif Shaik',
                'description': 'Token',
                'prefill': {
                  'contact': '8888888888',
                  'email': 'connectasifshaik@gmail.com'
                }
              };
              _razorpay.open(options);
            },
          )),
        )
          ],
        ),
    
            ),
          ],
        ),
        body: Scaffold(backgroundColor: Colors.white,)
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
class Appointment {
  String Name;
  int Number;
  static DateTime Date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  Appointment({
    required this.Name,
    required this.Number,
  });

  Map<String, dynamic> tomap() {
    Map<String, dynamic> request = {
      "Name": Name,
      "Number": Number,
      "Date": Date
    };
    return request;
  }

  static Future add(name, number) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    var users = db.collection("Appointments");
    await users.add(Appointment(
      Name: name,
      Number: int.parse(number),
    ).tomap());
  }
  static Future<int> getCount() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    int count = await db
        .collection('Appointments')
        .where("Date", isEqualTo: today)
        .get()
        .then((value) => value.size);
    return count;
  }
}
class Next extends StatefulWidget {
  const Next({Key? key}) : super(key: key);

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  final snackBar = const SnackBar(
    content: Text('Reached the limit!'),
  );
    final String now = DateFormat('dd-MM-yyyy').format(DateTime.now());
 var next = DateTime.now().add(const Duration(days:1));
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            children:[
              // one
               GestureDetector(
                onTap: () async {     
                  int total = await Appointment.getCount() + 1;
                  if (total < 5) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hos()),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                      margin: const EdgeInsets.all(20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        const Color.fromRGBO(170, 204, 180, 1),
                        const Color.fromRGBO(170, 204, 180, 1),
                        Color.fromRGBO(170, 204, 180, 1),
                        Color.fromARGB(255, 226, 226, 226),
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight, 
             
                    ),
            
                    borderRadius: BorderRadius.circular(20), //border corner radius
                  ),
                      child: Stack(children: [
                        Positioned(top: 15,
                        left: 15,
                          child: Text(DateFormat('EEEE').format(next).toUpperCase(), style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 5,fontWeight: FontWeight.w600),
              ),),),
                          Positioned(top: 38,
                        left: 15,
                          child: Text(now.toString(),style: const TextStyle(color: Colors.black38),)),
                           Positioned(bottom: 5,
                        right: 15,
                          child: Text("10 - 11", style: GoogleFonts.limelight(
              textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 35),
              ),)),
                      ]),
                ),),
              // two
                           GestureDetector(
                onTap: () async {
                  int total = await Appointment.getCount() + 1;
                  if (total < 7) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hos()),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                      margin: const EdgeInsets.all(20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                   Color.fromRGBO(88, 186, 180, 1),
                      Color.fromRGBO(88, 186, 180, 1),
                      Color.fromRGBO(88, 186, 180, 1),
                      Color.fromARGB(255, 224, 221, 221),
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight, 
             
                    ),
            
                    borderRadius: BorderRadius.circular(20), //border corner radius
                  ),
                      child: Stack(children: [
                        Positioned(top: 15,
                        left: 15,
                          child: Text(DateFormat('EEEE').format(next).toUpperCase(), style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 5,fontWeight: FontWeight.w600),
              ),),),
                          Positioned(top: 38,
                        left: 15,
                          child: Text(now.toString(),style: const TextStyle(color: Colors.black38),)),
                           Positioned(bottom: 5,
                        right: 15,
                          child: Text("11 - 12", style: GoogleFonts.limelight(
              textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 35),
              ),)),
                      ]),
                ),),
              // three
               GestureDetector(
                onTap: () async {
                  int total = await Appointment.getCount() + 1;
                  if (total < 7) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hos()),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                      margin: const EdgeInsets.all(20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                   Color.fromRGBO(187, 170, 204, 1),
                      Color.fromRGBO(187, 170, 204, 1),
                      Color.fromRGBO(187, 170, 204, 1),
                      Color.fromARGB(255, 224, 221, 221),
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight, 
             
                    ),
            
                    borderRadius: BorderRadius.circular(20), //border corner radius
                  ),
                      child: Stack(children: [
                        Positioned(top: 15,
                        left: 15,
                          child: Text(DateFormat('EEEE').format(next).toUpperCase(), style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 5,fontWeight: FontWeight.w600),
              ),),),
                          Positioned(top: 38,
                        left: 15,
                          child: Text(now.toString(),style: const TextStyle(color: Colors.black38),)),
                           Positioned(bottom: 5,
                        right: 15,
                          child: Text("12 - 01", style: GoogleFonts.limelight(
              textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 35),
              ),)),
                      ]),
                ),),
              // four
               GestureDetector(
                onTap: () async {
                  int total = await Appointment.getCount() + 1;
                  if (total < 7) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hos()),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                      margin: const EdgeInsets.all(20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                  Color.fromRGBO(178, 134, 115, 1),
                      Color.fromRGBO(178, 134, 115, 1),
                      Color.fromRGBO(178, 134, 115, 1),
                      Color.fromARGB(255, 224, 221, 221),
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight, 
             
                    ),
            
                    borderRadius: BorderRadius.circular(20), //border corner radius
                  ),
                      child: Stack(children: [
                        Positioned(top: 15,
                        left: 15,
                          child: Text(DateFormat('EEEE').format(next).toUpperCase(), style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 5,fontWeight: FontWeight.w600),
              ),),),
                          Positioned(top: 38,
                        left: 15,
                          child: Text(now.toString(),style: const TextStyle(color: Colors.black38),)),
                           Positioned(bottom: 5,
                        right: 15,
                          child: Text("01 - 02", style: GoogleFonts.limelight(
              textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 35),
              ),)),
                      ]),
                ),),
        
                // five
                GestureDetector(
                onTap: () async {
                  int total = await Appointment.getCount() + 1;
                  if (total < 7) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hos()),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                      margin: const EdgeInsets.all(20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                    Color.fromRGBO(134, 142, 214, 1),
                      Color.fromRGBO(134, 142, 214, 1),
                     Color.fromRGBO(134, 142, 214, 1),
                      Color.fromARGB(255, 224, 221, 221),
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight, 
             
                    ),
            
                    borderRadius: BorderRadius.circular(20), //border corner radius
                  ),
                      child: Stack(children: [
                        Positioned(top: 15,
                        left: 15,
                          child: Text(DateFormat('EEEE').format(next).toUpperCase(), style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 5,fontWeight: FontWeight.w600),
              ),),),
                          Positioned(top: 38,
                        left: 15,
                          child: Text(now.toString(),style: const TextStyle(color: Colors.black38),)),
                           Positioned(bottom: 5,
                        right: 15,
                          child: Text("04 - 05", style: GoogleFonts.limelight(
              textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 35),
              ),)),
                      ]),
                ),),
          ]),
        ),
      ),
    );
  }
}
