// https://newsapi.org/v2/everything?q=tesla&from=2023-06-20&sortBy=publishedAt&apiKey=5f2a92a5a8ce4f9fa1bb8a1c9cab86e5
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

import '../../Componentes/components.dart';

class SearchScreen extends StatelessWidget {
  var SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: SearchController,
                        type: TextInputType.text,
                        validate: (String? Value) {
                          if (Value!.isEmpty) {
                            return 'search is empty';
                          } else
                            return null;
                        },
                        label: 'search',
                        prefix: Icons.search,
                      onChange: (value) {
                        NewsCubit.get(context).getSearch(value);
                      },

                    ),

                  ],
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true))
            ],


          ),
        );
      },
    );
  }
}
