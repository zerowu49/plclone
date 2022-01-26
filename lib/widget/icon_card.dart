import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconCard extends StatelessWidget {
  final String platformName;
  final String imagePath;
  final Function() onPressed;

  IconCard({
    Key? key,
    required this.platformName,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        // style: ElevatedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(40.0),
        //     side: BorderSide(color: Colors.blue),
        //   ),
        // ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   imagePath,
            //   height: 120,
            // ),
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50.0,
            ),
            SizedBox(height: 2.h),
            Text(platformName),
          ],
        ),
      ),
    );
  }
}
