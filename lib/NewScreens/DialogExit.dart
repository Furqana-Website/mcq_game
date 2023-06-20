import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mcq_game/helper/ScreenUtilsClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class exitDialog extends StatefulWidget {
  @override
  _exitDialogState createState() => _exitDialogState();
}

class _exitDialogState extends State<exitDialog> {

  @override
  Widget build(BuildContext context) {
    bool isTab = ScreenUtilClass.isLarge(context);

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: isTab?512:412,
                height: isTab?320:300,
                margin: EdgeInsets.all(3),
                child: Image.asset(
                  'assets/exitbackg.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 30,
                child: Container(
                  width:isTab?447:364,
                  height:isTab?173:140,
                  margin: EdgeInsets.all(3),
                  child: Image.asset(
                    'assets/exitbacktxt.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isTab?const Text(
                      "Do you really \nwant to exit?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Degular"),
                    ):const Text(
                      "Do you really \nwant to exit?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Degular"),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: isTab?112:100,
                                height:50,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop(false);

                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/no_button.png'),
                                      const Text("No",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              height: 1.0,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: "Degular")),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width:isTab?112:100,
                              height:50,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop(true);
                                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');

                                  // Navigator.of(context, rootNavigator: true)
                                  //     .pop();
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/yes_button.png',
                                    ),
                                    const Text("Yes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            height: 1.0,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "Degular"))
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


// class DialogExit extends StatefulWidget {
//
//   @override
//   State<StatefulWidget> createState() => DialogExitBox();
// }
//
// class DialogExitBox extends State<DialogExit>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 400));
//     scaleAnimation =
//         CurvedAnimation(parent: controller, curve: Curves.bounceOut);
//
//     controller.addListener(() {
//       setState(() {});
//     });
//
//     controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Center(
//         child: Material(
//           color: Colors.transparent,
//           child: ScaleTransition(
//             scale: scaleAnimation,
//             child: Align(
//               alignment: Alignment.center,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: ScreenUtilClass.isLarge(context) ? 0.6.sw : 0.65.sw,
//                     height: ScreenUtilClass.isLarge(context)? 0.6.sh : 0.75.sh,
//                     margin: EdgeInsets.all(3),
//                     child: Image.asset(
//                       'assets/exitbackg.png',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     top: 55.h,
//                     child: Container(
//                       width: 0.45.sw,
//                       height: ScreenUtilClass.isLarge(context)? 0.25.sh : 0.33.sh,
//                       margin: const EdgeInsets.all(3),
//                       child: Image.asset(
//                         'assets/exitbacktxt.png',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 55.h,
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Do you really \nwant to exit?",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Degular"),
//                         ),
//                         SizedBox(height: 2.h,),
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(height: 2.h,),
//                                 SizedBox(
//                                     width: 0.22.sw,
//                                     height:
//                                     ScreenUtilClass.isLarge(context)? 0.08.sh : 0.10.sh,
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.of(context, rootNavigator: true)
//                                             .pop();
//                                       },
//                                       child: Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           Image.asset('assets/no_button.png'),
//                                           Text("No",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15.sp,
//                                                   height: 1.0,
//                                                   fontWeight: FontWeight.w800,
//                                                   fontFamily: "Degular")),
//                                         ],
//                                       ),
//                                     )),
//                             SizedBox(height: 2.h,),
//                                 SizedBox(
//                                   width: 0.22.sw,
//                                   height: ScreenUtilClass.isLarge(context)? 0.08.sh : 0.10.sh,
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                       Navigator.of(context, rootNavigator: true)
//                                           .pop();
//                                     },
//                                     child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Image.asset(
//                                           'assets/yes_button.png',
//                                         ),
//                                         Text("Yes",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 15.sp,
//                                                 height: 1.0,
//                                                 fontWeight: FontWeight.w800,
//                                                 fontFamily: "Degular"))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h,)
//                               ]),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
