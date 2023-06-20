import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mcq_game/helper/VedioPlayer.dart';
import 'package:mcq_game/const/AppColor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    Platform.isAndroid
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color containerColor = Colors.red;
  bool iscorrect = false;
  late List<bool> selectedRowList = [false, false, false, false];

  void changeColor() {
    setState(() {
      containerColor = Colors.transparent;
    // Change to desired color
    });
  }

  void changeBg() {
    setState(() {
      iscorrect = true; // Change to desired color
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> aboveimages = [
      'assets/Options.png',
      'assets/Options.png',
    ];
    final List<String> belowimages = [
      'assets/Options.png',
      'assets/Options.png',
    ];

    return Scaffold(
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
                      image: AssetImage('assets/BG.png'),
                      fit: BoxFit.fill, // Replace with the path to your image
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
                      child: Text('Use the Correct article',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 20,
                              height: 2,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Grandstander")),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              right: 470,
              bottom: 0,
              child: GestureDetector(
                onTap: changeColor,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  // Replace with desired background color
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 250,
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/exit.png',
                              fit: BoxFit.cover,
                            )),
                      ),
                      // Container(
                      //   height: 300,
                      //   color: Colors.transparent, // Replace with desired color for the bottom image
                      //   child:
                      //   GestureDetector(
                      //     onTap: changeColor,
                      //     child: Container(
                      //       height: 250,
                      //       width: 250,
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage('assets/Questions.png'),
                      //         ),
                      //       ),
                      //       child: Stack(
                      //         children: [
                      //           Positioned(
                      //             top: 50,
                      //             left: 50,
                      //             right: 50,
                      //             child: Container(
                      //               height: 200,
                      //               width: 200,
                      //               alignment: Alignment.center,
                      //               // decoration: BoxDecoration(
                      //               //   image: DecorationImage(
                      //               //     image: AssetImage('assets/horse.png'),
                      //               //     fit: BoxFit.contain,
                      //               //   ),
                      //               // ),
                      //                child: false?const Center(child:
                      //                Center(
                      //                  widthFactor: 255,
                      //                  heightFactor: 50,
                      //                  child: Text("Apple",
                      //                   style :TextStyle(color: Color(0xffA22451),
                      //                      fontSize: 24,
                      //                      height: 1.0,
                      //                      fontWeight: FontWeight.w700,
                      //                      fontFamily: "Degular")),
                      //                ),
                      //                ):Image.asset("assets/horse.png"),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 30),
                        child: Container(
                          height: 290,
                          width: 286,
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
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Container(
                                  width: 265,
                                  height: 256,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                        child:
                                        Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage('assets/horse.png')),
                                            ),
                                              child: InkWell(
                                                onTap: ()
                                                {

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                          const VideoContentWidget(videoURL: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",closeIconURL: 'https://picsum.photos/250?image=9')
                                                      )
                                                  );
                                                  print("object tab");

                                                },
                                                child: Container(
                                                  width: 112,
                                                  height: 112,
                                                   decoration: BoxDecoration(
                                                     color: Colors.black.withOpacity(0.5),
                                                     borderRadius: BorderRadius.circular(100),
                                                     image: DecorationImage(image: AssetImage("assets/play.png")),
                                                    ),
                                                ),
                                              ))
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
              top: 50,
              left: 400,
              right: 20,
              bottom: 0,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (String option in (aboveimages))
                            InkWell(
                              onTap: () {
                                setState(() {
                                  iscorrect = !iscorrect;
                                });
                              },
                              /* ContainerColor=Color(0xffFFF2DE)
                              * MaterialColor=Color(0xff89A4E8)
                              * borderColor=Color(0xffDCE6FF)
                               */
                              child: Container(
                                decoration: BoxDecoration(
                                  color:true?AppColors.tappedWrongContainerColor:iscorrect?AppColors.tappedCorrectContainerColor:AppColors.containerColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Material(
                                  elevation: 10,
                                  color: true?AppColors.tappedWrongMaterialColor:iscorrect?AppColors.tappedCorrectMaterialColor:AppColors.materialColor,
                                  shadowColor: Color(0xff89A4E8),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: 168,
                                      height: 120,
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
                                            color: true?AppColors.tappedWrongshadowColor:iscorrect?AppColors.tappedCorrectshadowColor:AppColors.shadowColor.withOpacity(0.4),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                        border: Border.all(
                                            color:true?AppColors.tappedWrongborderColor:iscorrect?AppColors.tappedCorrectborderColor:AppColors.borderColor,
                                            width: 10),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset("assets/horse.png"),
                                      ),
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
                            ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     for (String option in belowimages)
                      //       Container(
                      //         height: 120,
                      //         width: 168,
                      //         decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //             image: AssetImage('assets/Options.png'), // Replace with your image path
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //         child: InkWell(
                      //           onTap: () {
                      //             // Handle option selection
                      //           },
                      //
                      //           child: Padding(
                      //             padding: EdgeInsets.all(15.0),
                      //             child: Center(
                      //               child: Image.asset('assets/horse.png',
                      //                 height: 120,
                      //                 width: 120,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (String option in (aboveimages))
                            InkWell(
                              onTap: () {
                                changeBg();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFFF2DE),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Material(
                                  elevation: 10,
                                  color: Color(0xff89A4E8),
                                  shadowColor: Color(0xff89A4E8),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: 168,
                                      height: 120,
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
                                        border: Border.all(
                                            color: Color(0xffDCE6FF),
                                            width: 10),
                                      ),

                                      child: true
                                          ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset("assets/horse.png"),
                                      )
                                          : const Center(
                                          child: Text(
                                              style: TextStyle(
                                                  color: Color(0xFF4424A2),
                                                  fontSize: 20,
                                                  height: 2,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  "Grandstander"),
                                              "ABCDEFGHIGH")),
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
                              // child: Container(
                              //   height: 120,
                              //   width: 168,
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       image: AssetImage('assets/Options.png'), // Replace with your image path
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(15.0),
                              //     child: Center(
                              //       child: true?
                              //       const Text("data"):Image.asset('assets/horse.png',
                              //         height: 120,
                              //         width: 120,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ),
                        ],
                      ),
                    ],
                  )

              ),
            ),
          ],
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
          InkWell(
              onTap: () {
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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                padding: EdgeInsets.all(10),
                child: Material(
                  elevation: 5,
                  color: Color(0xff89A4E8),
                  shadowColor: Color(0xff89A4E8),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
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
                        border: Border.all(color: Color(0xffDCE6FF), width: 10),
                      ),

                      child: const Center(
                          child: Text(
                              style: TextStyle(
                                  color: Color(0xFF4424A2),
                                  fontSize: 20,
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Grandstander"),
                              "ABCDEFGHIGH")),
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
              )),
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
              onTap: () {},
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Material(
                        elevation: 5,
                        color: Color(0xff89A4E8),
                        shadowColor: Color(0xff89A4E8),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
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
                              border: Border.all(
                                  color: Color(0xffDCE6FF), width: 10),
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
                            image: AssetImage('assets/soundbg.png'),
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
