import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/view/screens/home_screen.dart';
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
         ..getBuisnessNews()
        ..getSienceNews()
        ..getSportsNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return HomeScreen();

              //Scaffold(
              // appBar: AppBar(
              //   title: PrimaryText(
              //     text: 'News App',
              //     fontWeight: FontWeight.bold,
              //     textAlign: TextAlign.start,
              //     alignment: Alignment.centerLeft,
              //     fontSize: 28,
              //   ),
              //   actions: [
              //     IconButton(
              //       icon: Icon(
              //         Icons.search,
              //         size: 35,
              //       ),
              //       onPressed: () {},
              //     )
              //   ],
              // ),
              // bottomNavigationBar: BottomNavigationBar(
              //   items: cubit.bottomItems,
              //   currentIndex: cubit.currentIndex,
              //   onTap: (index) {
              //     cubit.changeBottomNavIndex(index);
              //   },
              // ),
              //    body: cubit.screens[cubit.currentIndex],
             // body: HomeScreen(),
           // );
          }),
    );
  }
}
