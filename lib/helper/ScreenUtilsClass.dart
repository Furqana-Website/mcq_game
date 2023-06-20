import 'package:flutter/material.dart';

class ScreenUtilClass extends StatelessWidget {

  late final Widget largeScreen;
  late final Widget mediumScreen;

  late final Widget smallScreen;


  ScreenUtilClass(this.largeScreen, this.mediumScreen, this.smallScreen, {super.key});


  static bool isSmall(BuildContext context)
  {
    return MediaQuery.sizeOf(context).width<800;
  }
  static bool isMedium(BuildContext context)
  {
    return MediaQuery.sizeOf(context).width>=800&&MediaQuery.sizeOf(context).width<1200;
  }
  static bool isLarge(BuildContext context)
  {
    return MediaQuery.sizeOf(context).width>=1200;
  }

  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
       builder: (context,constraints)
           {
             if(constraints.maxWidth>1200)
               {
                 return largeScreen;
               }
             else if(constraints.maxWidth>=800&& constraints.maxWidth<=1200)
               {
                 return mediumScreen??largeScreen;
               }
                return smallScreen??largeScreen;
           }
     );
  }
}
