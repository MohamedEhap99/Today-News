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
              fit: BoxFit.cover,
              image:article['urlToImage']!=null?NetworkImage('${article['urlToImage']}')as ImageProvider:
              const AssetImage('assets/images/No_Image.jpg'),
            ),
  
          ),
  
        ),
  
        const SizedBox(width: 20.0,),
  
        Expanded(
  
          child: SizedBox(
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
  
                  style:const TextStyle(
  
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
    physics:const BouncingScrollPhysics(),
    itemBuilder:(BuildContext context, int index)=>buildArticleItem(list[index],context) ,
    separatorBuilder:(context,index)=> Container(
      width:10.0 ,
      height:10.0 ,
      color: Colors.grey,
    ),
    itemCount:list.length,
  ),
  fallback:(context)=>isSearch?Container():const Center(child: CircularProgressIndicator()),
);

Widget defualtFormField({
  IconData?prefixicon,
  String?labeltext,
  TextInputType?keboardtype,
  FormFieldValidator<String>?validate,
  TextEditingController?controller,
  ValueChanged<String>?onChanged,
})=>TextFormField(
  decoration:InputDecoration(
    prefixIcon:Icon(prefixicon),
    labelText: labeltext,
  ),
  keyboardType:keboardtype,
  validator:validate,
  controller:controller,
  onChanged:onChanged ,
);

void navigateTo(context,widget)=>Navigator.push(context,MaterialPageRoute(
    builder:(context)=>widget,
),
);