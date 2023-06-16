import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/data/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void changeAppMode({bool fromShared})
  {
    if(fromShared != null){
      isDark=fromShared;
      emit(NewsChangeMode());
    }else{
      isDark = !isDark;
      CacheHelper.putBoolean(key: "isDark", value: isDark).then((value) {
        emit(NewsChangeMode());
      });
    }
  }
}