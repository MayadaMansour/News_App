import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultNewsItem(article,context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: "'https://newsapi.org/'+${article["urlToImage"]}",
            imageBuilder: (context, imageProvider) {
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.deepOrange,),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Text(
                  '${article['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
                Text(
                  "${article['publishedAt']}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articalBuilder(list,context)=> ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index) => defaultNewsItem(list[index],context),
    itemCount: 10,
    separatorBuilder: ( context, index)=>myDivider(),),
  fallback:(context)=>Center(
    child: CircularProgressIndicator(),),);
