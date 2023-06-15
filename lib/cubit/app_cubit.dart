import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void changeAppMode()
  {
      isDark = !isDark;
        emit(NewsChangeMode());
  }
}