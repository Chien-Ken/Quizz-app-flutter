import 'package:app_trac_nghiem/apps/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final Function onTap;

  ButtonCustom({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onTap(), // Call the function when the button is tapped
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff44A3AE),
                Color(0xff33f3C9),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: getHeight(context) * 0.02),
            child: Align(
              child: Text(
                title.toString(),
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
