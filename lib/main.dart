import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plclone/page/main_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (ctx, orientation, deviceType) {
        return MaterialApp(
          title: "Peduli Lindungi Clone",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainPage(),
        );
      },
    );
  }
}
