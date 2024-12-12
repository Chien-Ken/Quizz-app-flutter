import 'package:app_trac_nghiem/Provider/category_provider.dart';
import 'package:app_trac_nghiem/Screens/home/widget/home_dropdown.dart';
import 'package:app_trac_nghiem/Screens/home/widget/home_title.dart';
import 'package:app_trac_nghiem/Widget/background_custom.dart';
import 'package:app_trac_nghiem/Widget/button_custom.dart';
import 'package:app_trac_nghiem/apps/routes/router_name.dart';
import 'package:app_trac_nghiem/apps/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // Optional constructor for arguments
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = context.watch<CategoryProvider>().idLanguageChoose;
    Size size = MediaQuery.sizeOf(context);
    // Build the UI using other widgets
    return Scaffold(
      body: Stack(
        children: [
          BackgroundCustom(),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTitle(),
                  HomeDropdown(),
                  SizedBox(
                    height: getHeight(context) * 0.06,
                  ),
                  ButtonCustom(
                    title: 'Start Practice',
                    onTap: () {
                      if (language == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please choose a language',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      } else {
                        context.goNamed(RoutersName.categoryName);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
