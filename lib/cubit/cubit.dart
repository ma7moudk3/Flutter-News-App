import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/view/screens/buisness_screen.dart';
import 'package:news_app/view/screens/science_screen.dart';
import 'package:news_app/view/screens/settings_screens.dart';
import 'package:news_app/view/screens/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_rounded), label: 'Sport'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  ];

  List<Widget> screens = [
    BuisnessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreens()
  ];

  void changeBottomNavIndex(index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> buisenssNews = [];
  void getBuisnessNews() {
    emit(NewsBuisenessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'eeccb7b3106a47a1b4e2f993e81f4c90'
    }).then((value) {
      buisenssNews = value.data['articles'];
      print(buisenssNews[0]['title']);
      emit(NewsGetBuisnessSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsGetBuisnessErrorState(error.toString()));
    });
  }

  List<dynamic> sportsNews = [];
  void getSportsNews() {
    emit(NewsSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'eeccb7b3106a47a1b4e2f993e81f4c90'
    }).then((value) {
      sportsNews = value.data['articles'];
      print(sportsNews[0]['title']);
      emit(NewsSportsSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsSportsErrorState(error.toString()));
    });
  }

  List<dynamic> sienceNews = [];
  void getSienceNews() {
    emit(NewsSicnceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'eeccb7b3106a47a1b4e2f993e81f4c90'
    }).then((value) {
      sienceNews = value.data['articles'];
      print(sienceNews[0]['title']);
      emit(NewsSicnceSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsSicnceErrorState(error.toString()));
    });
  }
}
