
import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';

import 'article_item.dart';
import 'conditional_builder.dart';

class ArticlesBuilder extends StatelessWidget {
  const ArticlesBuilder({
    Key key,
    @required this.list, this.state,
  }) : super(key: key);

  final List list;
  final state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition:list.length > 0,
      builder: (BuildContext context) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => ArticleItem(article: list[index]),
            separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 10,
                  indent: 10,
                ),
            itemCount: 10);
      },
      fallback: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
