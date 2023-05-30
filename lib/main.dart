import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/home_layout_newsapp.dart';
import 'package:newsapp/network/remote/Dio_helper.dart';

void main() {
  DioHelper.init();
  // Bloc.observer;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
    builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
          child: News_layout(),
          textDirection: TextDirection.ltr,
        ),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          // primarySwatch: Colors.deepOrange,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.orange,
              elevation: 20.0),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black26,
            ),
          ),
        ),
        darkTheme: ThemeData(

          primarySwatch: Colors.deepOrange,
          textTheme: TextTheme(

              bodyMedium: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
          scaffoldBackgroundColor: HexColor('333739'),
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor('333739'),
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: HexColor('333739'),
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 25.0,
            ),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            backgroundColor: HexColor('333739'),
          ),
        ),
        themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
      );
    }
        ),
    );
  }
}
