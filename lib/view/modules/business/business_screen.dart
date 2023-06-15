
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants/componant.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(

      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetLoadingState,
          builder: (context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index) => defaultNewsItem(list[index]),
            itemCount: 10,
            separatorBuilder: ( context, index)=>myDivider(),),
          fallback:(context)=>Center(
            child: CircularProgressIndicator(),),);
      },
    );
  }
}