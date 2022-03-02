import 'package:flutter/material.dart';
import 'package:plclone/widget/custom_back_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool? withArrow;

  CustomAppBar({
    required this.title,
    required this.actions,
    this.withArrow = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: CustomBackButton(withArrow: withArrow),
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

PreferredSizeWidget tokpedAppBar() => CustomAppBar(
      title: "Check-in PeduliLindungi",
      withArrow: true,
      actions: [
        IconButton(
          tooltip: 'Tokopedia Menu',
          splashRadius: 30,
          onPressed: () {},
          icon: Icon(
            Icons.view_comfy,
            color: Colors.black,
          ),
        ),
      ],
    );

PreferredSizeWidget gojekAppBar() => CustomAppBar(
      title: "PeduliLindungi",
      actions: [
        IconButton(
          tooltip: 'Refresh',
          splashRadius: 30,
          onPressed: () {},
          icon: Icon(
            Icons.refresh,
            color: Colors.black,
          ),
        ),
        IconButton(
          splashRadius: 30,
          onPressed: null,
          icon: Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        IconButton(
          splashRadius: 30,
          onPressed: null,
          icon: Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
      ],
    );
