
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/modules/web_view/web.dart';

Widget BuildArticleItem(article, context) {
  String publishedAt = article['publishedAt'] , date = '' , time = '';
  for(int i = 0 ; i < publishedAt.length ; ++i){
    if(publishedAt[i] == 'T'){
      date = publishedAt.substring(0,i);
      time = publishedAt.substring(i+1 , publishedAt.length-1);
      break;
    }
  }
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(article['url']),
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    '${date + ' - ' + time}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

Widget articalBuilder(list,context,{isSearch=false})=> ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index) => BuildArticleItem(list[index],context),
    itemCount: 10,
    separatorBuilder: ( context, index)=>myDivider(),),
  fallback:(context)=>isSearch? Container(): Center(
    child: CircularProgressIndicator(),),);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);



Widget ArticleItem(article, context) {
  String publishedAt = article['publishedAt'] , date = '' , time = '';
  for(int i = 0 ; i < publishedAt.length ; ++i){
    if(publishedAt[i] == 'T'){
      date = publishedAt.substring(0,i);
      time = publishedAt.substring(i+1 , publishedAt.length-1);
      break;
    }
  }
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(article['url']),
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child:
              Text(
                '${article['title']}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),

            Text(
              '${article['author']}',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w400

              ),
            ),
            Text(
              '${date + ' - ' + time}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget articalBuilder2(list,context,{isSearch=false})=> ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index) => ArticleItem(list[index],context),
    itemCount: 15,
    separatorBuilder: ( context, index)=>myDivider(),),
  fallback:(context)=>isSearch? Container(): Center(
    child: CircularProgressIndicator(),),);