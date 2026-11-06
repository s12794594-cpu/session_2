
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_2/Cubit/ArticlesCubit/ArticleCubit.dart';
import 'package:session_2/Cubit/ArticlesCubit/ArticleState.dart';
import 'package:session_2/Cubit/SourcesCubit/SourceCubit.dart';
import 'package:session_2/Cubit/SourcesCubit/SourceState.dart';

import 'CategoryScreen.dart';
import 'SourceScreen.dart';

void main() {


  //login

  runApp(
    MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (context) => sourceCubit(),
        ),
        BlocProvider(
          create: (context) => articleCubit(),
        ),
      ],
      child:MaterialApp(
// categor
        home: Categoryscreen (),
      ),
    ),
  );
}
// c1
//c2
// c3


