import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mcq_game/NewScreens/MCQvedioImage.dart';
import 'package:mcq_game/const/AppColor.dart';
import 'package:mcq_game/helper/ScreenUtilsClass.dart';

import 'NewScreens/DialogExit.dart';
import 'api/api_service.dart';
import 'model/user_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    Platform.isAndroid
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(texttext());
}
class texttext extends StatefulWidget {

  @override
  _texttextState createState() => _texttextState();
}

class _texttextState extends State<texttext> {
  List<DataModel> dataModels = [];

  int currentIndex=0;
  Color containerColor = Colors.red;
  bool iscorrect=false;
  late List<bool> selectedRowList=[false,false,false,false];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  Future<void> loadData() async {
    List<DataModel> models = await DataService.loadDataFromJson();
    setState(() {
      dataModels = models;

    });

  }
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
  final List<String> itemList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

   Color containColor=Color(0xffFFF2DE);
   Color materialColor=Color(0xff89A4E8);
   Color shadowColor=Color(0xff89A4E8);
   Color borderColor=Color(0xffDCE6FF);

  Color containColor2=Color(0xffFFF2DE);
  Color materialColor2=Color(0xff89A4E8);
  Color shadowColor2=Color(0xff89A4E8);
  Color borderColor2=Color(0xffDCE6FF);
  Color containColor3=Color(0xffFFF2DE);
  Color materialColor3=Color(0xff89A4E8);
  Color shadowColor3=Color(0xff89A4E8);
  Color borderColor3=Color(0xffDCE6FF);

  final List<String> aboveimages = [
    'assets/Options.png',
    'assets/Options.png',
    'assets/Options.png',
    'assets/Options.png',

  ];

  String CorrectAnswer='item 2';
  Color containColor4=Color(0xffFFF2DE);
  Color materialColor4=Color(0xff89A4E8);
  Color shadowColor4=Color(0xff89A4E8);
  Color borderColor4=Color(0xffDCE6FF);
  late int  level;
  late String option1;
  late String option2;
  late String option3;
  late String option4;
   bool onclicked=false;
  void changeImageColor(int index) {
    setState(() {
      print(dataModels[currentIndex].options[index-1]==dataModels[currentIndex].correctAnswer);
      if (index == 1) {
        if(dataModels[currentIndex].options[index-1]==dataModels[currentIndex].correctAnswer) {
          containColor = AppColors.tappedCorrectContainerColor;
          materialColor = AppColors.tappedCorrectMaterialColor;
          shadowColor = AppColors.tappedCorrectshadowColor;
          borderColor = AppColors.tappedCorrectborderColor;
        }
        else{
          containColor = AppColors.tappedWrongContainerColor;
          materialColor = AppColors.tappedWrongMaterialColor;
          shadowColor = AppColors.tappedWrongshadowColor;
          borderColor = AppColors.tappedWrongborderColor;
        }
      } else if (index == 2 ){
        if(dataModels[currentIndex].options[index-1]==dataModels[currentIndex].correctAnswer) {
          containColor2 = AppColors.tappedCorrectContainerColor;
          materialColor2 = AppColors.tappedCorrectMaterialColor;
          shadowColor2 = AppColors.tappedCorrectshadowColor;
          borderColor2 = AppColors.tappedCorrectborderColor;
        }
        else{
          containColor2 = AppColors.tappedWrongContainerColor;
          materialColor2 = AppColors.tappedWrongMaterialColor;
          shadowColor2 = AppColors.tappedWrongshadowColor;
          borderColor2 = AppColors.tappedWrongborderColor;
        }
      } else if (index == 3) {
        if(dataModels[currentIndex].options[index-1]==dataModels[currentIndex].correctAnswer) {
          containColor3 = AppColors.tappedCorrectContainerColor;
          materialColor3=AppColors.tappedCorrectMaterialColor;
          shadowColor3=AppColors.tappedCorrectshadowColor;
          borderColor3=AppColors.tappedCorrectborderColor;
        }
        else{
          containColor3 = Color(0xffFACECE);
          materialColor3 = const Color(0xffD36161);
          shadowColor3 = const Color(0xffD36161);
          borderColor3 = const Color(0xffF29A9A);
        }
      }
      else if (index == 4) {
        containColor4= Color(0xffFACECE);
        materialColor4=const Color(0xffD36161);
        shadowColor4=const Color(0xffD36161);
        borderColor4=const Color(0xffF29A9A);

      //
      // containerColor = const Color(0xffFACECE);
      //   materialColor=const Color(0xffD36161);
      //   shadowColor=const Color(0xffD36161);
      //   borderColor=const Color(0xffF29A9A);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    level=dataModels[currentIndex].level;
    option1=dataModels[currentIndex].options[0];
    option2=dataModels[currentIndex].options[1];
    option3=dataModels[currentIndex].options[2];
    option4=dataModels[currentIndex].options[3];
    final List<String> belowimages = [
      // 'assets/Options.png',
      // 'assets/Options.png',


    ];

    // Timer(
    //     Duration(seconds: 10),
    //         () =>
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(
    //             builder: (BuildContext context) =>
    //                 vedioimage()
    //         )));

    Size screenSize = MediaQuery.sizeOf(context);
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return MaterialApp(
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
                                  builder: (context) => exitDialog());
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
                                    '$level/10',
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
                        padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(top: 50):const EdgeInsets.only(top: 8),
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

                                  child: false?Container(

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
                                  ):Text(
                                      dataModels[currentIndex].question,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:  Color(0xFFA22451),
                                          fontSize: ScreenUtilClass.isLarge(context)?30:20,
                                          height: 2,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Grandstander")
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              Expanded(
                child: Padding(
                  padding: ScreenUtilClass.isLarge(context)?EdgeInsets.only(top: 60):const EdgeInsets.only(top: 16),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () => changeImageColor(1),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: containColor,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),),

                                padding: EdgeInsets.all(10),

                                child: Material(
                                  elevation: 5,
                                  color: materialColor,
                                  shadowColor: shadowColor,
                                  borderRadius: BorderRadius.all(Radius.circular(40)
                                  ),
                                  child: Padding(
                                    padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(bottom: 15):ScreenUtilClass.isSmall(context)?const EdgeInsets.all(0):const EdgeInsets.only(bottom: 10),
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
                                            color: shadowColor.withOpacity(0.9),
                                            blurRadius: 4,
                                            offset: Offset(0, 8),
                                          ),
                                        ],
                                        border: Border.all(color: borderColor,
                                            width: 5),

                                      ),

                                      child:  Center(child: Text(
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                              color: Color(0xFF4424A2),
                                              fontSize: ScreenUtilClass.isLarge(context)?30:16,
                                              height: 2,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Grandstander"), option1)),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: () => changeImageColor(2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: containColor2,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),),

                                padding: EdgeInsets.all(10),

                                child: Material(
                                  elevation: 5,
                                  color: materialColor2,
                                  shadowColor: shadowColor2,
                                  borderRadius: BorderRadius.all(Radius.circular(40)
                                  ),
                                  child: Padding(
                                    padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(bottom: 15):ScreenUtilClass.isSmall(context)?const EdgeInsets.all(0):const EdgeInsets.only(bottom: 10),
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
                                            color: shadowColor2.withOpacity(0.9),
                                            blurRadius: 4,
                                            offset: Offset(0, 8),
                                          ),
                                        ],
                                        border: Border.all(color: borderColor2,
                                            width: 5),

                                      ),

                                      child:  Center(child: Text(
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                              color: Color(0xFF4424A2),
                                              fontSize: ScreenUtilClass.isLarge(context)?30:16,
                                              height: 2,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Grandstander"),option2)),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      ScreenUtilClass.isLarge(context)?const SizedBox(height: 40.0):const SizedBox(height: 10.0), // Add spacing between top and bottom images
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () => changeImageColor(3),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: containColor3,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),),

                                padding: EdgeInsets.all(10),

                                child: Material(
                                  elevation: 5,
                                  color: materialColor3,
                                  shadowColor: shadowColor3,
                                  borderRadius: BorderRadius.all(Radius.circular(40)
                                  ),
                                  child: Padding(
                                    padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(bottom: 15):ScreenUtilClass.isSmall(context)?const EdgeInsets.all(0):const EdgeInsets.only(bottom: 10),
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
                                            color: shadowColor3.withOpacity(0.9),
                                            blurRadius: 4,
                                            offset: Offset(0, 8),
                                          ),
                                        ],
                                        border: Border.all(color: borderColor3,
                                            width: 5),

                                      ),

                                      child:  Center(child: Text(
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                              color: Color(0xFF4424A2),
                                              fontSize: ScreenUtilClass.isLarge(context)?30:16,
                                              height: 2,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Grandstander"),option3)),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: () => changeImageColor(4),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: containColor4,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),),

                                padding: EdgeInsets.all(10),

                                child: Material(
                                  elevation: 5,
                                  color: materialColor4,
                                  shadowColor: shadowColor4,
                                  borderRadius: BorderRadius.all(Radius.circular(40)
                                  ),
                                  child: Padding(
                                    padding: ScreenUtilClass.isLarge(context)?const EdgeInsets.only(bottom: 15):ScreenUtilClass.isSmall(context)?const EdgeInsets.all(0):const EdgeInsets.only(bottom: 10),
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
                                            color: shadowColor4.withOpacity(0.9),
                                            blurRadius: 4,
                                            offset: Offset(0, 8),
                                          ),
                                        ],
                                        border: Border.all(color: borderColor4,
                                            width: 5),

                                      ),

                                      child:  Center(child: Text(
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                              color: Color(0xFF4424A2),
                                              fontSize: ScreenUtilClass.isLarge(context)?30:16,
                                              height: 2,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Grandstander"),itemList.isNotEmpty ? itemList[3] : 'No items')),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
            ),
          )
      ),
    );
  }


}


