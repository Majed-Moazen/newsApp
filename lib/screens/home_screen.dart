import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cubit/cubit_news.dart';
import 'package:news_app/core/cubit/cubti_state.dart';

import '../my_widget/item_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text(
      //     'Lasted News',
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.brown,
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Breaking News',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Text(
            'show More',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 4,
          )
        ],
      ),
      body: BlocConsumer<CubitNews, CubitState>(
        builder: (BuildContext context, CubitState state) {
          if (state is LoadedSuccessState) {
            print(state.newsModelHeadLine.length);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    margin: EdgeInsets.all(10),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.fitHeight,
                                  imageUrl: state.newsModelHeadLine[index]
                                      .urlToImage ??
                                      '',
                                  progressIndicatorBuilder: (context, url,
                                      downloadProgress) =>
                                      Center(
                                          child: CircularProgressIndicator(
                                              value:
                                              downloadProgress.progress)),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.black54,
                                            Colors.black54,
                                            Colors.black
                                          ])),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.newspaper,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            'World',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 80,
                                    height: 25,
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    left: 5,
                                    right: 5,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              Image.asset(state.newsModelHeadLine[index].urlLogoImage,width: 20,height: 20,),
                                             SizedBox(width: 4,), Text(
                                                state.newsModelHeadLine[index].source,
                                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          state.newsModelHeadLine[index].title,
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: state.newsModelHeadLine.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.newsModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemNews(
                            // isNew: index < 3,
                            newsModel: state.newsModel[index]);
                      }),
                ],
              ),
            );
          } else if (state is LoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Center(child: Text('Not Found Data'));
        },
        listener: (BuildContext context, CubitState state) {
          if (state is LoadedErrorState)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
        },
      ),
    );
  }
}
