import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article,context)=>InkWell(
  onTap:(){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width:120,
  
          height:120,
  
          decoration:BoxDecoration(
  
            borderRadius:BorderRadius.circular(10.0),
  
            image:DecorationImage(
  
              image:NetworkImage('${article['urlToImage']}'),
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
        ),
  
        SizedBox(width: 20.0,),
  
        Expanded(
  
          child: Container(
  
            height: 120,
  
            child: Column(
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child:   Text(
  
                    '${article['title']}',
  
  
  
                    style:Theme.of(context).textTheme.bodyText1,
  
                    maxLines:3,
  
                    overflow: TextOverflow.ellipsis,
  
  
  
                  ),
  
                ),
  
                Text(
  
                  '${article['publishedAt']}',
  
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

Widget articleBuilder(list,context, {isSearch = false})=>ConditionalBuilder(
  condition:list.length>0,
  builder: (context)=>ListView.separated(
    physics:BouncingScrollPhysics(),
    itemBuilder:(BuildContext context, int index)=>buildArticleItem(list[index],context) ,
    separatorBuilder:(context,index)=> Container(
      width:10.0 ,
      height:10.0 ,
      color: Colors.grey,
    ),
    itemCount:10,
  ),
  fallback:(context)=>isSearch?Container():Center(child: CircularProgressIndicator()),
);

Widget DefualtFormField({
  IconData?prefixicon,
  String?labeltext,
  TextInputType?keboardtype,
  FormFieldValidator<String>?validate,
  TextEditingController?Controller,
  ValueChanged<String>?onchanged,
})=>TextFormField(
  decoration:InputDecoration(
    prefixIcon:Icon(prefixicon),
    labelText: labeltext,
  ),
  keyboardType:keboardtype,
  validator:validate,
  controller:Controller,
  onChanged:onchanged ,
);

void navigateTo(context,Widget)=>Navigator.push(context,MaterialPageRoute(
    builder:(context)=>Widget,
),
);