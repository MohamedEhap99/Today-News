import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class News_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(BuildContext context,NewsStates state){
        NewsCubit Cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text(
              'Today News',
            ),
            actions: [
            IconButton(
                onPressed: (){
                  navigateTo(context, Search_Screen());
                },
                icon:Icon(Icons.search),
            ),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).ChangeAppMode();
                },
                icon:Icon(Icons.brightness_4_outlined),
            ),


            ],
          ),
          body:Cubit.Screens[Cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            items: Cubit.bottomItem,
            currentIndex:Cubit.currentIndex,
            onTap:(index)=> Cubit.ChangeBottomNavBar(index),
          ),
        );
      }
    );
  }
}
