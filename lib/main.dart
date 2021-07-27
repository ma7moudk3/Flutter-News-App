import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/view/news_layout.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'package:news_app/view/screens/sport_screen.dart';

void main() {
  DioHelper.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              backwardsCompatibility: false,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black, size: 35),
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.white)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed)),
      home: NewsLayout(),
    );
  }
}
