import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mcq_game/NewScreens/DialogExit.dart';
import 'package:mcq_game/helper/ScreenUtilsClass.dart';

import 'DialogBox.dart';
import 'MCQaudiotoimage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    Platform.isAndroid
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(home:MyApp()));
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
            () =>
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AudioImage()
                    )));


    final List<String> aboveimages = [
      'assets/Options.png',
      'assets/Options.png',

    ];
    final List<String> belowimages = [
      // 'assets/Options.png',
      // 'assets/Options.png',





    ];


    Size screenSize = MediaQuery.sizeOf(context);
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    Timer(
        Duration(seconds: 10),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>
                    AudioImage()
            )));


    return WillPopScope(
    onWillPop: () async {
      return await showDialog(
          context: context,
          builder: (context) => exitDialog());

    },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              color: Color(0xffF0B08C),// Set the background color
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/BGtext.png'),
                    fit: BoxFit.fill, // Replace with the path to your image
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:  ScreenUtilClass.isLarge(context)?EdgeInsets.only(left: 56,top: 50):EdgeInsets.only(left: 40,top: 24),
                            child: Container(
                              // height: ScreenUtilClass.isLarge(context)?MediaQuery.sizeOf(context).height*0.1:MediaQuery.sizeOf(context).height*0.1,
                              // width: ScreenUtilClass.isLarge(context)?MediaQuery.sizeOf(context).width*0.15:MediaQuery.sizeOf(context).width*0.4,
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: ()
                                { print("clicked");
                                showDialog(
                                    context: context,
                                    builder: (context) => DialogBox());
                                },
                                child: Image.asset(
                                  'assets/exit.png',
                                  width: ScreenUtilClass.isLarge(context)?60:40,
                                  height:ScreenUtilClass.isLarge(context)?60:40,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(70.0),
                              bottomRight: Radius.circular(70.0),
                            ),
                            child: Container(
                              height:screenHeight*0.14,

                              width:ScreenUtilClass.isLarge(context)?650:screenWidth*0.6,

                              color: const Color(0xff33B3E1),
                              child: Center(
                                child: Text(
                                    'Use the Correct article',
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize:ScreenUtilClass.isLarge(context)?30:20,
                                        height: 2,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Grandstander")
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:ScreenUtilClass.isLarge(context)?EdgeInsets.only(top:25):EdgeInsets.only(top: 12),

                            child:Container(
                              width: ScreenUtilClass.isLarge(context)?screenWidth*0.9:screenWidth*0.4,
                              height: ScreenUtilClass.isLarge(context)?80:screenHeight*0.1,
                              alignment: Alignment.topRight,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/leveloption.png'),
                                  fit: BoxFit.fitHeight
                                ),
                              ),
                              child: Container(
                                child:  Center(
                                  child: Text(
                                      '1/10',
                                      style: TextStyle(
                                          color: const Color(0xffFFFFFF),
                                          fontSize:ScreenUtilClass.isLarge(context)?25:20,
                                          height: 2,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Grandstander")
                                  ),
                                ),
                              ),
                            )

                            ,
                          ),
                        ),
                      ],
                    ),


                    Column(
                      children: [
                        Padding(
                          padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(top: 50):const EdgeInsets.only(top: 15),
                          child: Container(
                            width:screenWidth*0.7,
                            height:ScreenUtilClass.isLarge(context)?screenWidth*0.15:screenHeight*0.28,

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
                                child: Container(
                                  width: screenWidth*9,
                                  height: screenHeight*1,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(

                                      Radius.circular(60),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Center(

                                    child: Container(

                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(

                                            Radius.circular(60),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child:
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/music.png',
                                                width: 100,
                                                height: 100,
                                              ),
                                              SizedBox(width: 30.0),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xffFFB648),
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: Image.asset(
                                                  'assets/sound.png',
                                                  width: 50,
                                                  height: 50,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextAudioWidget(),
                          ScreenUtilClass.isLarge(context)?SizedBox(height: 100):SizedBox(height: 15),
                          CustomTextAudioWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
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
                    padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(bottom: 15):ScreenUtilClass.isSmall(context)?const EdgeInsets.all(0):const EdgeInsets.only(bottom: 5),
                    child: Container(
                      width: ScreenUtilClass.isLarge(context)?MediaQuery.sizeOf(context).width*0.36:MediaQuery.sizeOf(context).width*0.25,
                      height:ScreenUtilClass.isLarge(context)? MediaQuery.sizeOf(context).width*0.09:MediaQuery.sizeOf(context).height*0.15,
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
                            color: Colors.blue.withOpacity(0.9),
                            blurRadius: 4,
                            offset: Offset(0, 8),
                          ),
                        ],
                        border: Border.all(color: Color(0xffDCE6FF),
                            width: 10),

                      ),

                      child:  Center(child: Text(
                          textAlign: TextAlign.center,
                          style:TextStyle(
                              color: Color(0xFF4424A2),
                              fontSize: ScreenUtilClass.isLarge(context)?30:16,
                              height: 2,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Grandstander"),"ABCDEFGHIGH")),
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
                decoration: const BoxDecoration(
                    color: Color(0xffFFF2DE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                // Replace with your desired background color
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [


                    Container(
                      width: MediaQuery.sizeOf(context).width/4,
                      height: ScreenUtilClass.isLarge(context)?MediaQuery.sizeOf(context).height*0.14:MediaQuery.sizeOf(context).height*0.16,
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
                          padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(bottom: 15):const EdgeInsets.only(bottom: 5),
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

                    ScreenUtilClass.isLarge(context)?SizedBox(width: 20.0):SizedBox(width: 15.0),
                    Container(
                      width: ScreenUtilClass.isLarge(context)?60:40,
                      height: ScreenUtilClass.isLarge(context)?60:40,
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

