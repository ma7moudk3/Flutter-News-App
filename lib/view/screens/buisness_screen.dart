import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/view/widgets/article_builder.dart';
import 'package:news_app/view/widgets/article_item.dart';
import 'package:news_app/view/widgets/conditional_builder.dart';
import 'package:news_app/view/widgets/primaryText.dart';

class BuisnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).buisenssNews;

        return ArticlesBuilder(list: list,state: state,);
      },
    );
  }
}
