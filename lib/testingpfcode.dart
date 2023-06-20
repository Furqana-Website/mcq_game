import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mcq_game/helper/ScreenUtilsClass.dart';

import '../helper/VedioPlayer.dart';
import 'NewScreens/DialogExit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    Platform.isAndroid
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(vedioimage());
}
class vedioimage extends StatefulWidget {
  @override
  _vedioimageState createState() => _vedioimageState();
}

class _vedioimageState extends State<vedioimage> {
  Color containerColor = Colors.red;
  bool iscorrect=false;
  late List<bool> selectedRowList=[false,false,false,false];
  final List<String> itemList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  final int itemsPerRow = 2;
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


    Size screenSize = MediaQuery.sizeOf(context);
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    Color containColor=Color(0xffFFF2DE);
    Color materialColor=Color(0xff89A4E8);
    Color shadowColor=Color(0xff89A4E8);
    Color borderColor=Color(0xffDCE6FF);

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
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: (itemList.length / itemsPerRow).ceil(),
                            itemBuilder: (context, rowIndex) {
                              final startIndex = rowIndex * itemsPerRow;
                              final endIndex = (rowIndex + 1) * itemsPerRow;
                              final rowItems = itemList.sublist(startIndex, endIndex < itemList.length ? endIndex : itemList.length);

                              return GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: itemsPerRow,
                                children:
                                rowItems.map((item) =>
                                    Container(
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
                                                  color: shadowColor.withOpacity(0.9),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 8),
                                                ),
                                              ],
                                              border: Border.all(color: borderColor,
                                                  width: 10),

                                            ),

                                            child:  Center(child: Text(
                                              textAlign: TextAlign.center,
                                              style:TextStyle(
                                                  color: Color(0xFF4424A2),
                                                  fontSize: ScreenUtilClass.isLarge(context)?30:16,
                                                  height: 2,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Grandstander"),
                                              itemList.isNotEmpty ? itemList[0] : 'No items',)),
                                          ),
                                        ),
                                      ),
                                    )).toList(),
                              );
                            },
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

