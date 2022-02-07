import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Sports_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(BuildContext context, NewsStates state){},
      builder:(BuildContext context, NewsStates state){
        NewsCubit Cubit=NewsCubit.get(context);
        var list=NewsCubit.get(context).sports;
        return  articleBuilder(list,context);
      },
    );
  }
}