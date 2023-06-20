import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mcq_game/const/AppColor.dart';
import 'package:mcq_game/helper/ScreenUtilsClass.dart';

import '../api/api_service.dart';
import '../model/user_model.dart';
import 'DialogBox.dart';
import 'DialogExit.dart';
import 'MCQtexttotext.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    Platform.isAndroid
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(home:textImage()));
}
class textImage extends StatefulWidget {
  @override
  _textImageState createState() => _textImageState();
}

class _textImageState extends State<textImage> {
  List<DataModel> dataModels=[];
  int currentIndex=1;
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
    loadData();
  }


  Future<void> loadData() async {
    List<DataModel> models = await DataService.loadDataFromJson();
    setState(() {
      dataModels = models;

    });
  }


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


  Color containColor4=Color(0xffFFF2DE);
  Color materialColor4=Color(0xff89A4E8);
  Color shadowColor4=Color(0xff89A4E8);
  Color borderColor4=Color(0xffDCE6FF);

  void changeImageColor(int index) {
    setState(() {
      print(dataModels[currentIndex].options[index-1]);
      print(dataModels[currentIndex].correctAnswer);

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
    Future.delayed(
      Duration.zero,
          () =>
          showDialog(
              context: context,
              builder: (context) => DialogBox()),
    );
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
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
                  image: AssetImage('assets/BGimage.png'),
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
                                  builder: (context) =>

                                      exitDialog());
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:ScreenUtilClass.isLarge(context)?const EdgeInsets.only(top: 170, left: 60, right: 30):
                        const EdgeInsets.only(top: 20, left: 60, right: 30),
                        child: Container(
                          height: ScreenUtilClass.isLarge(context)?screenHeight*0.5:screenHeight*0.75,
                          width:  ScreenUtilClass.isLarge(context)?screenHeight*0.5:screenWidth*0.3,
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
                                        child:  Text(
                                            textAlign: TextAlign.center,
                                            'I have  __________terrible  tootache',
                                            style: TextStyle(
                                                color: Color(0xFFA22451),
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
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: ScreenUtilClass.isLarge(context)?EdgeInsets.only(top: 170,left:20):const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () => changeImageColor(1),
                                      child: Container(
                                        width: ScreenUtilClass.isLarge(context)?screenWidth*0.2:screenWidth*0.2,
                                        height: ScreenUtilClass.isLarge(context)?screenHeight*0.23:screenHeight*0.36,
                                        decoration:  BoxDecoration(
                                          color:containColor,
                                          borderRadius:
                                          const BorderRadius.all(Radius.circular(40)),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Material(
                                          elevation: 10,
                                          color:materialColor,
                                          shadowColor: Color(0xff89A4E8),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                          child: Padding(
                                            padding:ScreenUtilClass.isLarge(context)?EdgeInsets.only(bottom: 15): const EdgeInsets.only(bottom: 10),
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
                                                    color:shadowColor.withOpacity(0.4),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                                border: Border.all(
                                                    color: borderColor,
                                                    width: 10),
                                              ),

                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset(dataModels[currentIndex].options[0]),//chnage accordimg to api



                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  GestureDetector(
                                    onTap: () => changeImageColor(2),
                                    child: Container(
                                      width: ScreenUtilClass.isLarge(context)?screenWidth*0.2:screenWidth*0.2,
                                      height: ScreenUtilClass.isLarge(context)?screenHeight*0.23:screenHeight*0.36,
                                      decoration:  BoxDecoration(
                                        color:containColor2,
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(40)),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Material(
                                        elevation: 10,
                                        color:materialColor2,
                                        shadowColor: shadowColor2,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                        child: Padding(
                                          padding:ScreenUtilClass.isLarge(context)?EdgeInsets.only(bottom: 15): const EdgeInsets.only(bottom: 10),
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
                                                  color:shadowColor2.withOpacity(0.4),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: borderColor2,
                                                  width: 10),
                                            ),

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(dataModels[currentIndex].options[1]),



                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () => changeImageColor(3),
                                    child: Container(
                                      width: ScreenUtilClass.isLarge(context)?screenWidth*0.2:screenWidth*0.2,
                                      height: ScreenUtilClass.isLarge(context)?screenHeight*0.23:screenHeight*0.36,
                                      decoration:  BoxDecoration(
                                        color:containColor3,
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(40)),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Material(
                                        elevation: 10,
                                        color:materialColor3,
                                        shadowColor: shadowColor3,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                        child: Padding(
                                          padding:ScreenUtilClass.isLarge(context)?EdgeInsets.only(bottom: 15): const EdgeInsets.only(bottom: 10),
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
                                                  color:shadowColor3.withOpacity(0.4),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: borderColor3,
                                                  width: 10),
                                            ),

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(dataModels[currentIndex].options[2]),



                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => changeImageColor(4),
                                    child: Container(
                                      width: ScreenUtilClass.isLarge(context)?screenWidth*0.2:screenWidth*0.2,
                                      height: ScreenUtilClass.isLarge(context)?screenHeight*0.23:screenHeight*0.36,
                                      decoration:  BoxDecoration(
                                        color:containColor4,
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(40)),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Material(
                                        elevation: 10,
                                        color:materialColor4,
                                        shadowColor: Color(0xff89A4E8),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                        child: Padding(
                                          padding:ScreenUtilClass.isLarge(context)?EdgeInsets.only(bottom: 15): const EdgeInsets.only(bottom: 10),
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
                                                  color:shadowColor4.withOpacity(0.4),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: borderColor4,
                                                  width: 10),
                                            ),

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(dataModels[currentIndex].options[3]),



                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }


}

