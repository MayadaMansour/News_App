import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants/componant.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var list =NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller:searchController ,
                  type:TextInputType.text ,
                  validate: (String value){
                    if(value.isEmpty ){
                      return "Search must not empty";
                    }else{
                      return null;
                    }
                  },
                  label:"Search",
                  prefix: Icons.search,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  }
                ),
              ),

              Expanded(child: articalBuilder(list, context,isSearch: true))
            ],
          ),
        );
      } ,
    );
  }

}