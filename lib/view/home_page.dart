import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(
                    "موقع الأخبار",
                  ),
                ),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                  IconButton(onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                      icon: Icon(Icons.brightness_4_outlined)),
                ],

              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
            );
          },
        ));
  }
}
