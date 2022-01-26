import 'package:flutter/material.dart';
import 'package:plclone/widget/custom_back_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  CustomAppBar({required this.title, required this.actions});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: CustomBackButton(),
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      actions: actions,
      backgroundColor: Colors.white,
    );
  }
}
