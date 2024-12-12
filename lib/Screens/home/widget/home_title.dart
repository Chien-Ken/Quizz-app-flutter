import 'package:app_trac_nghiem/apps/utils/constants.dart';
import 'package:flutter/material.dart';


class HomeTitle extends StatelessWidget {
  // Optional constructor for arguments
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build the UI using other widgets
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           Text(
        'Let\'s play a quiz game',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: getHeight(context) * 0.02,
      ),
      Text('Set of quizzes designed by zendVN'),
      SizedBox(
        height: getHeight(context) * 0.06,
      ),
      ]
   
    );
  }
}
