import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/data/remote/dio_helper.dart';
import 'package:news_app/view/modules/business/business_screen.dart';
import 'package:news_app/view/modules/science/science_screen.dart';
import 'package:news_app/view/modules/sports/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();
    emit(NewsBottomNavState());
  }


  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsGetLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'422cac4414304a08b4933b3419194be3',
      },
    ).then((value)
    {
      business = value.data['articles'];
      print(value.data['articles'][0]);
      emit(NewsGetBusinessSucessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetLoadingSportsState());
    if(sports.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'422cac4414304a08b4933b3419194be3',
        },
      ).then((value)
      {
        sports = value.data['articles'];
        print(value.data['articles'][0]);
        emit(NewsGetBusinessSucessState());
      }).catchError((error){
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetBusinessSucessState());
    }
  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetLoadingScienceState());

    if(science.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'422cac4414304a08b4933b3419194be3',
        },
      ).then((value)
      {
        science = value.data['articles'];
        print(value.data['articles'][0]);
        emit(NewsGetScienceSucessState());
      }).catchError((error){
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSucessState());
    }
  }


  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'422cac4414304a08b4933b3419194be3',
      },
    ).then((value)
    {
      search = value.data['articles'];
      print(value.data['articles'][0]);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}