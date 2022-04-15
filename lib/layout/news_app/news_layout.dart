import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(BuildContext context,NewsStates state){
        NewsCubit cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text(
              'Today News',
            ),
            actions: [
            IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon:const Icon(Icons.search),
            ),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).ChangeAppMode();
                },
                icon:const Icon(Icons.brightness_4_outlined),
            ),


            ],
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex:cubit.currentIndex,
            onTap:(index)=> cubit.changeBottomNavBar(index),
          ),
        );
      }
    );
  }
}
