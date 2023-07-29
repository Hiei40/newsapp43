import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Componentes/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context1, state) {
          var list =NewsCubit.get(context1).Sports ;
          return articleBuilder(list, context);
        },
      );

    }
}
