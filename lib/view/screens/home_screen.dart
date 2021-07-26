import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/constanses/categories_map.dart';
import 'package:news_app/view/widgets/primaryText.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: PrimaryText(
        //   text: 'News App',
        //   fontWeight: FontWeight.bold,
        //   textAlign: TextAlign.start,
        //   alignment: Alignment.centerLeft,
        //   fontSize: 28,
        // ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Color(0xFFEBF2F8),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Icon(
                Ionicons.search,
                size: 29,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Wrap(children: [
                PrimaryText(
                  text: 'Discover Lastest',
                  alignment: Alignment.centerLeft,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                PrimaryText(
                  text: 'News',
                  alignment: Alignment.centerLeft,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              PrimaryText(
                text:
                    '${DateTime.now().hour} : ${DateTime.now().minute}   |   ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}',
                textColor: Colors.grey,
                alignment: Alignment.centerLeft,
              ),
              Divider(
                thickness: 1.2,
                height: 45,
                color: Colors.blueGrey.withOpacity(0.4),
              ),
              PrimaryText(
                text: 'Choose Topic',
                alignment: Alignment.centerLeft,
                textColor: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 25),
                            height: 95,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                color: categories[index]['color'],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                              children: [
                                Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Image.network(
                                      categories[index]['icon'],
                                    )),
                                SizedBox(
                                  width: 25,
                                ),
                                PrimaryText(
                                  alignment: Alignment.centerLeft,
                                  text: categories[index]['name'],
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            ),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
