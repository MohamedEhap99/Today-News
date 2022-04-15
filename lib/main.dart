import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/modules/splash_screen/splash_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'cubit/states.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations(
       [
         DeviceOrientation.portraitUp,
         DeviceOrientation.portraitDown,
       ]
   );
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  BlocOverrides.runZoned(
    () {
      // Use blocs...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({Key? key, this.isDark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..ChangeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(
                  color: Colors.deepOrange,
                ),
                unselectedIconTheme: IconThemeData(
                  color: Colors.grey,
                ),
                elevation: 20.0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
              ),
              floatingActionButtonTheme:const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme:const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.deepOrange,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle:const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme:const IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedIconTheme:const IconThemeData(
                  color: Colors.deepOrange,
                ),
                unselectedIconTheme:const IconThemeData(
                  color: Colors.white,
                ),
                unselectedItemColor:Colors.white,
                elevation: 20.0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
              ),
              floatingActionButtonTheme:const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme:const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              primarySwatch: Colors.deepOrange,
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            // themeMode:ThemeMode.light,
            home:const SplashScreen(),
          );
        },
      ),
    );
  }
}
