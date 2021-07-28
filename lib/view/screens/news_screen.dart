import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/view/widgets/article_builder.dart';
import 'package:news_app/view/widgets/conditional_builder.dart';
import 'package:news_app/view/widgets/primaryText.dart';

class NewsScreen extends StatelessWidget {
  final String categoryName;

  const NewsScreen({@required this.categoryName}) ;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getSportsNews()..getSienceNews()..getBuisnessNews(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: PrimaryText(
            text: categoryName,
            alignment: Alignment.centerLeft,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),

        ),
        body: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocConsumer<NewsCubit, NewsStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var sportList = NewsCubit.get(context).sportsNews;
                  var scienceList = NewsCubit.get(context).sienceNews;
                  var businessList = NewsCubit.get(context).buisenssNews;
                  return NewsBuilder(list: categoryName == "Sport" ? sportList : categoryName == "Science" ? scienceList : businessList,state: state,);
                },
              );
            }),
      ),
    );
  }
}


class NewsBuilder extends StatelessWidget {
  final list;
  final state;

  const NewsBuilder({Key key, this.list, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // flex: 1,
            child: ConditionalBuilder(
                condition: list.length > 0,
                builder: (context) => ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Stack(children: [
                          Image.network(
                            list[index]['urlToImage'] != null
                                ? list[index]['urlToImage']
                                : 'https://cdn.dribbble.com/users/247394/screenshots/14369946/media/dbbf39e7622f1a36966581361b34ea38.png?compress=1&resize=1200x900',
                            fit: BoxFit.cover,
                            width:
                            MediaQuery.of(context).size.width -
                                120,
                            height: double.infinity,
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  PrimaryText(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    maxLines: 2,
                                    text: list[index]['title'],
                                    alignment: Alignment.topLeft,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  PrimaryText(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    maxLines: 2,
                                    textColor: Colors.grey,
                                    text: list[index]
                                    ['publishedAt'],
                                    alignment: Alignment.topLeft,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    )),
                fallback:  (BuildContext context) {
                  return Center(child: CircularProgressIndicator());}
            )),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: PrimaryText(
            text: 'Trending news',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            maxLines: 2,
            textColor: Colors.grey,
            alignment: Alignment.topLeft,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          // flex: 1,
            child: ArticlesBuilder(
              list: list,
              state: state,
            )),
      ],
    );
  }
}

