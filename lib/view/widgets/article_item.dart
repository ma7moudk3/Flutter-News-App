import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/primaryText.dart';

class ArticleItem extends StatelessWidget {
  final article;
  const ArticleItem({
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${article['urlToImage']}'))),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: PrimaryText(
                      text: '${article['title']}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                    ),
                  ),
                  PrimaryText(
                    text: '${article['publishedAt']}',
                    fontSize: 18,
                    textColor: Colors.grey,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
