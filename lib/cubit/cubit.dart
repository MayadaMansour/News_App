import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/data/remote/dio_helper.dart';
import 'package:news_app/view/modules/business/business_screen.dart';
import 'package:news_app/view/modules/science/science_screen.dart';
import 'package:news_app/view/modules/settings/settings_screen.dart';
import 'package:news_app/view/modules/sports/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItem=[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<String> titles = ['Business News', 'Sport News', 'Science News'];
  List<dynamic> business=[];

  void changeIndex(int index){
    currentIndex = index;
    emit(NewsChangedBottomNavState());
  }

  void getBusiness(){
    emit(NewsGetLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: { 'country':'eg',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'}).then((value) {
        business=value.data['articles'];
        emit(NewsGetBusinessSucessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }


}