import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mcq_game/NewScreens/MCQtexttotext.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();

    SystemChrome.setPreferredOrientations([
      Platform.isAndroid
          ? DeviceOrientation.landscapeLeft
          : DeviceOrientation.landscapeRight
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: texttext(),
      ),
    );
  }
  catch(e)
  {
    print(e);
  }

}
