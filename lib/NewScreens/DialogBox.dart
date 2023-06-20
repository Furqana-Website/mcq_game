import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mcq_game/helper/ScreenUtilsClass.dart';

class DialogBox extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon at the to
            Container(
                width:ScreenUtilClass.isLarge(context)?MediaQuery.sizeOf(context).width*0.7:MediaQuery.sizeOf(context).width*0.56,
                height:ScreenUtilClass.isLarge(context)?500:270,
                decoration: BoxDecoration(
                     color: Colors.transparent,
                    image: DecorationImage(image: AssetImage('assets/notes.png',),
                    fit: BoxFit.fill)
                ),
                child: SingleChildScrollView(
                  child: Container(
                      padding: ScreenUtilClass.isLarge(context)?EdgeInsets.all(100):const EdgeInsets.all(50),
                      child: Center(
                        child: Text(
                            'Use the Correct article'
                                'hello how are you the game is awesome'
                                'Use the Correct article'
                                'hello how are you the game is awesome'
                                'Use the Correct article'
                                'hello how are you the game is awesome'
                            'Use the Correct article'
                        'hello how are you the game is awesome'
                        'Use the Correct article'
                            'hello how are you the game is awesome'
                            'Use the Correct article'
                            'hello how are you the game is awesome',
                            textAlign: TextAlign.center,
                            style: TextStyle(

                                color: Color(0xffA22451),
                                fontSize:ScreenUtilClass.isLarge(context)?30:20,
                                height: 2,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Grandstander")
                        ),
                      )
                  ),
                )
            )
          ],
        ),
      ),
    );
  }



}
