import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/Bussines/Bussines.dart';
import 'package:newsapp/Modules/Sports/Sports.dart';
import 'package:newsapp/Modules/science/Science.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/local/SharedPrefrences.dart';

import '../network/remote/Dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
  ];
  List<Widget> screen = [Business(), Sport(), Sciences()];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavStates());
  }

  List<dynamic> bussiness = [];
  void getBussiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '5f2a92a5a8ce4f9fa1bb8a1c9cab86e5',
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      bussiness = value.data['articles'];
      print(bussiness[0]['title']);
      emit(NewsGetBusinessSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetBusinessErrorStates(onError.toString()));
    });
  }

  List<dynamic> Sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (Sports.length == 0) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '5f2a92a5a8ce4f9fa1bb8a1c9cab86e5',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        Sports = value.data['articles'];
        print(Sports[0]['title']);
        emit(NewsGetSportsSuccessStates());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportsErrorStates(onError.toString()));
      });
    } else
      emit(NewsGetSportsSuccessStates());
  }

  List<dynamic> Science = [];
  void getScience() {
    emit(NewsGetSiecnceLoadingState());
    if (Science.length == 0) {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'c6ac78a84498468eaec475fece60400f',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        Science = value.data['articles'];
        print("t" + Science[0]['title']);
        emit(NewsGetSiecnceSuccessStates());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSiecnceErrorStates(onError.toString()));
      });
    } else {
      emit(NewsGetSiecnceSuccessStates());
    }
  }

  List<dynamic> Search = [];
  void getSearch(String searchValue) {
    emit(NewsGetSearchLoadingState());
    String value = searchValue;
    Search = [];
    // Define 'Value' as a local variable
    if(Search.length==0) {
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'apiKey': '5f2a92a5a8ce4f9fa1bb8a1c9cab86e5',
        },
      ).then((value) {
        Search = value.data['articles'];
        print(Search[0]['title']);
        emit(NewsGetSearchSuccessStates());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSearchErrorStates(onError.toString()));
      });
    } else {
      emit(NewsGetSearchSuccessStates());
    }
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putboolean(key: 'isDark', value: isDark).then((value) {
      if (value) {
        emit(NewsChangeModeStates());
      }
    });
  }
}
