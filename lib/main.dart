import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plclone/page/main_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void initCondition() async {
    WidgetsFlutterBinding.ensureInitialized();
    var applicationsDocumentDirectory =
        await getApplicationDocumentsDirectory();
    Hive.init(applicationsDocumentDirectory.path);
    await initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    initCondition();
    return Sizer(
      builder: (ctx, orientation, deviceType) {
        return GetMaterialApp(
          title: "Peduli Lindungi Clone",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}
