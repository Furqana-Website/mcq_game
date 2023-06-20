import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    Platform.isAndroid
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color containerColor = Colors.red;
  bool iscorrect=false;
  late List<bool> selectedRowList=[false,false,false,false];

  void changeColor() {
    setState(() {
      containerColor = Colors.transparent; // Change to desired color
    });
  }
  void changeBg() {
    setState(() {
      iscorrect=true; // Change to desired color
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<String> aboveimages = [
      'assets/Options.png',
      'assets/Options.png',

    ];
    final List<String> belowimages = [
      // 'assets/Options.png',
      // 'assets/Options.png',





    ];




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
            children: [
              Container(
                color: Color(0xffF0B08C),// Set the background color
                child: Padding(
                  padding: const EdgeInsets.only(top: 3,left: 10,right: 10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage('assets/BGtext.png'),
                        fit: BoxFit.fill, // Replace with the path to your image
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 40,
                child: Container(
                  height: 70,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/leveloption.png'),
                      // fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Container(
                    height: 72,
                    width: 60,
                    child: Center(
                      child: Text(
                        '01/10',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 100,
                right: 100,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    child: Container(
                      height: 100,
                      width: 500,
                      color: const Color(0xff33B3E1),
                      child: Center(
                        child: Text(
                            'Use the Correct article',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                                height: 2,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Grandstander")
                        ),
                      ),
                    ),
                  ),
                ),

              ) ,
              Positioned(
                top: 10,
                left: 20,
                right: 470,
                bottom: 0,
                child: GestureDetector(
                  onTap:changeColor,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // Replace with desired background color
                    child: Column(
                      children: [
                        Padding(

                          padding: const EdgeInsets.only(top: 10,
                            right: 250,),
                          child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/exit.png',
                                fit: BoxFit.cover,
                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),



              Positioned(
                  top: 75,
                  left: 40,
                  right: 40,
                  child:Padding(
                    padding: const EdgeInsets.only(top: 1,bottom: 10,left: 50,right: 30),
                    child: Container(
                      width: 500,
                      height: 107,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(

                          Radius.circular(40),
                        ),
                        color: Color(0xffFFF2DE),
                      ),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(40),
                        strokeWidth: 4,
                        dashPattern: [12, 8],
                        color: Color(0xffF9DBAE),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: Container(
                            width: 900,
                            height: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(

                                Radius.circular(60),
                              ),
                              color: Colors.white,
                            ),
                            child:
                            const Center(
                              child: Text(
                                  'I have terrible __________ tootache',
                                  style: TextStyle(
                                      color: Color(0xFFA22451),
                                      fontSize: 20,
                                      height: 2,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Grandstander")
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      true?CustomTextAudioWidget():CustomTextWidget(),
                      SizedBox(height: 15.0),
                      true?CustomTextAudioWidget():CustomTextWidget(),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }


}
class CustomTextWidget extends StatelessWidget {
  final List<String> topImages = [
    'ABCDEFGHI',
    'ABCDEFGHI',
  ];
  final List<String> BottomImages = [
    'ABC',
    'a',
  ];

  CustomTextWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (String option in (topImages))
          InkWell(onTap: () {
            print("Pressed on tab");
          },
              // child: Container(
              //   width: 262,
              //   height: 80,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(true
              //           ? 'assets/textCorrect.png'
              //           : 'assets/textOption.png'),
              //       // Replace with your image path
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.all(12.0),
              //     child: Center(
              //       child: Text(
              //         "text",
              //         style: TextStyle(fontSize: 20.0),
              //       ),
              //     ),
              //   ),
              // ),

              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffFFF2DE),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),

                padding: EdgeInsets.all(10),

                child: Material(
                  elevation: 5,
                  color: Color(0xff89A4E8),
                  shadowColor: Color(0xff89A4E8),
                  borderRadius: BorderRadius.all(Radius.circular(40)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      width: 200,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Color(0xffDCE6FF),
                            width: 10),

                      ),

                      child: const Center(child: Text(style:TextStyle(
                          color: Color(0xFF4424A2),
                          fontSize: 20,
                          height: 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Grandstander"),"ABCDEFGHIGH")),
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: const BorderRadius.only(
                      //     bottomLeft: Radius.circular(40),
                      //     bottomRight: Radius.circular(40),
                      //     topRight: Radius.circular(40),
                      //     topLeft: Radius.circular(40),
                      //   ),
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.black.withOpacity(0.4),
                      //       blurRadius: 4,
                      //       offset: Offset(0, 4),
                      //     ),
                      //   ],
                      // ),
                    ),


                  ),
                ),
              )
          ),
      ],
    );
  }
}
class CustomTextAudioWidget extends StatelessWidget {
  final List<String> topImages = [
    'ABCDEFGHI',
    'ABCDEFGHI',
  ];
  final List<String> BottomImages = [
    'ABC',
    'a',
  ];

  CustomTextAudioWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (String option in (topImages))
          InkWell(
              onTap: () {
              },
              child: Container(
                width: 262,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xffFFF2DE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                // Replace with your desired background color
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Container(
                    //   width: 150,
                    //   height: 65,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage(
                    //           'assets/textOption.png'),
                    //       // Replace with your image path
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(12.0),
                    //     child: Center(
                    //       child:
                    //       Image.asset('assets/music.png'),
                    //     ),
                    //   ),
                    // ),

                    Container(
                      width: 129,
                      height: 61,
                      decoration: BoxDecoration(
                        color: Color(0xffFFF2DE),
                        borderRadius: BorderRadius.all(Radius.circular(10)),),

                      child: Material(
                        elevation: 5,
                        color: Color(0xff89A4E8),
                        shadowColor: Color(0xff89A4E8),
                        borderRadius: BorderRadius.all(Radius.circular(40)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              border: Border.all(color: Color(0xffDCE6FF),
                                  width: 10),

                            ),

                            child: Image.asset("assets/music.png"),
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: const BorderRadius.only(
                            //     bottomLeft: Radius.circular(40),
                            //     bottomRight: Radius.circular(40),
                            //     topRight: Radius.circular(40),
                            //     topLeft: Radius.circular(40),
                            //   ),
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: Colors.black.withOpacity(0.4),
                            //       blurRadius: 4,
                            //       offset: Offset(0, 4),
                            //     ),
                            //   ],
                            // ),
                          ),


                        ),
                      ),
                    ),

                    SizedBox(width: 16.0),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/soundbg.png'),
                            // Replace with your image path
                            fit: BoxFit.cover,
                          )), // Adjust the spacing between the images
                      child: Center(
                        child: Image.asset(
                          'assets/sound.png',
                          // Replace with your second image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
      ],
    );
  }
}

