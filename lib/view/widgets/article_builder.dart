import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';

import 'article_item.dart';
import 'conditional_builder.dart';

class ArticlesBuilder extends StatelessWidget {
  const ArticlesBuilder({
    Key key,
    @required this.list,
    this.state,
  }) : super(key: key);

  final List list;
  final state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.length > 0,
      builder: (BuildContext context) {
        return ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => ArticleItem(article: list[index]),
            itemCount: list.length);
      },
      fallback: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
