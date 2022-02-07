import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(AppInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  List<Widget>Screens=[
    Business_Screen(),
    Sports_Screen(),
    Science_Screen(),
  ];
  List<BottomNavigationBarItem>bottomItem=
  [
    BottomNavigationBarItem(
      icon:Icon(Icons.business),
      label:'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.sports),
      label:'Sports',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.science),
      label:'Science',
    ),
  ];
  int currentIndex=0;

  void ChangeBottomNavBar(int index){
    currentIndex=index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(ChangeBottomNavBarState());
  }
//65f7f556ec76449fa7dc7c0069f040ca
  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'731f6c2e7ad64e68979f1d4f332c6a4f',
      },
    ).then((value){
      //print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports(){
    emit(NewsSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'731f6c2e7ad64e68979f1d4f332c6a4f',
        },
      ).then((value){
        //print(value.data['articles'][0]['title']);
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> science=[];
  void getScience(){
    emit(NewsScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'731f6c2e7ad64e68979f1d4f332c6a4f',
        },
      ).then((value){
        //print(value.data['articles'][0]['title']);
        science=value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error));
      });
    }
    else{
      emit(NewsGetScienceSuccessState());
    }

  }


  List<dynamic> search=[];
  void getSearch(String value){
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url:'v2/everything',
      query:{
        'q':'$value',
        'apiKey':'731f6c2e7ad64e68979f1d4f332c6a4f',
      },
    ).then((value){
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });


  }



}