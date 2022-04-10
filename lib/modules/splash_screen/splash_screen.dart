
import 'package:flutter/material.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return SplashScreenView(
  navigateRoute: News_Screen(),
  duration: 2000,
  imageSize: 130,
  imageSrc: "assets/images/logo2.jpeg",
  backgroundColor: Colors.white,
);
  }


}