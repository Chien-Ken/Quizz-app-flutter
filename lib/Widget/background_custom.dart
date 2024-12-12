import 'package:flutter/material.dart';

class BackgroundCustom extends StatelessWidget {
  // Optional constructor for arguments
  const BackgroundCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build the UI using other widgets
    return Positioned.fill(
            child: Image.asset('assets/images/background.png', fit: BoxFit.cover,),
            );
  }
}