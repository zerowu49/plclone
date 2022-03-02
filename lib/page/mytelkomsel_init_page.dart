import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MytelkomselInitPage extends StatelessWidget {
  const MytelkomselInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
              tooltip: 'Back',
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.black,
              ),
              width: 2,
              height: 35,
              child: Text(""),
            ),
            SizedBox(width: 8),
            Image.asset(
              "images/platform/my_telkomsel.png",
              width: 40,
            ),
            SizedBox(width: 20),
            Text(
              "PeduliLindungi",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Text("here..."),
          ],
        ),
      ),
    );
  }
}
