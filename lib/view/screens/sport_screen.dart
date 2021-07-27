import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/view/widgets/article_builder.dart';
import 'package:news_app/view/widgets/primaryText.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: PrimaryText(
          text: 'Sport',
          alignment: Alignment.centerLeft,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        // actions: [
        //   Container(
        //       margin: EdgeInsets.only(right: 20),
        //       height: 55,
        //       width: 55,
        //       decoration: BoxDecoration(
        //           color: Color(0xFFEBF2F8),
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //       child: Icon(
        //         Ionicons.search,
        //         size: 29,
        //       ))
        // ],
      ),
      body: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return BlocConsumer<NewsCubit, NewsStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var list = NewsCubit.get(context).sportsNews;
                return Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Stack(children: [
                                      Image.network(
                                        list[index]['urlToImage'],
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
                                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25)
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              PrimaryText(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                maxLines: 2,
                                                text:
                                                    list[index]['title'],
                                                alignment: Alignment.topLeft,
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(height: 15,),
                                              PrimaryText(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                maxLines: 2,
                                                textColor: Colors.grey,
                                                text:
                                                list[index]['publishedAt'],
                                                alignment: Alignment.topLeft,
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                ))),
                    Expanded(
                        flex: 1,
                        child: ArticlesBuilder(
                          list: list,
                          state: state,
                        )),
                  ],
                );
              },
            );
          }),
    );
  }
}
