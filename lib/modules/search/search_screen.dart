import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Search_Screen extends StatelessWidget{
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {

 return BlocConsumer<NewsCubit,NewsStates>(
   listener:(context,state){} ,
   builder:(context,state){
     var list=NewsCubit.get(context).search;
     return Scaffold(
       appBar: AppBar(),
       body:Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: DefualtFormField(
                 prefixicon:Icons.search,
                 labeltext:'Search',
                 keboardtype:TextInputType.text,
                 validate:(String?value){
                   if(value!.isEmpty){
                     return 'Search must not be empty';
                   }
                   return null;
                 },
                 onchanged: (value) {
NewsCubit.get(context).getSearch(value);
                 }
             ),
           ),

           Expanded(child: articleBuilder(list, context,isSearch:true ))
         ],
       ),
     );
   } ,
 );
  }

}