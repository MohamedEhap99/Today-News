import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(initialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark=false;
  void ChangeAppMode({bool?fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
      emit(AppChangeAppModeState());
    }
    else {
      isDark=!isDark;
      CacheHelper.putBoolean(key: 'isDark', value:isDark).then((value){
        emit(AppChangeAppModeState());
      });
    }


  }
  }
