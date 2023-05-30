import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class News_layout extends StatelessWidget {
  const News_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBussiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: cubit.screen[cubit.currentIndex],
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(icon: Icon(Icons.search),
                    onPressed: () {}
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {

                  NewsCubit.get(context).changeAppMode();
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
