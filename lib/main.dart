import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/data/remote/dio_helper.dart';
import 'package:news_app/view/home_page.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,NewsStates>(
        listener:(context,state){
        } ,
        builder:(context,state){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarBrightness: Brightness.dark
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.grey),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 50.0,
                    backgroundColor: Colors.white
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
              ),
              darkTheme:  ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor("333739"),
                appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor("333739"),
                      statusBarBrightness: Brightness.light
                  ),
                  elevation: 0.0,
                  backgroundColor: HexColor("333739"),
                  titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.grey),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 50.0,
                    backgroundColor: HexColor("333739")
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
              ),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light,
              home:  HomePage()
          );
        } ,
      ),
    );
  }
}

