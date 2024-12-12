
import 'package:app_trac_nghiem/Provider/category_provider.dart';
import 'package:app_trac_nghiem/Provider/question_provider.dart';
import 'package:app_trac_nghiem/apps/routes/routers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider()..getListLanguage(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuestionProvider(),
        ),
       
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            useMaterial3: true,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          routerConfig: RouterConfigCustom.router,
        ),
    );
  }
}