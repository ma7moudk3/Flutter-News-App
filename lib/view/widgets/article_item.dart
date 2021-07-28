import 'package:flutter/material.dart';
import 'package:news_app/view/screens/webview_screen.dart';
import 'package:news_app/view/widgets/primaryText.dart';

class ArticleItem extends StatelessWidget {
  final article;
  const ArticleItem({
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewExample(url: article['url'],)));
      }
      ,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 25, left: 15, right: 15),
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFDF0E2),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: article['urlToImage'] == null ?  NetworkImage('https://cdn.dribbble.com/users/247394/screenshots/14369946/media/dbbf39e7622f1a36966581361b34ea38.png?compress=1&resize=1200x900') : NetworkImage('${article['urlToImage']}'))),
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
                        maxLines: 2,
                      ),
                    ),
                    PrimaryText(
                      text: '${article['publishedAt']}',
                      fontSize: 18,
                      textColor: Colors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.left,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
