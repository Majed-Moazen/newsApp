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
      appBar: AppBar(
        title: const Text(
          'Lasted News',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: BlocConsumer<CubitNews, CubitState>(
        builder: (BuildContext context, CubitState state) {
          if (state is LoadedSuccessState)
            return ListView.builder(
              itemCount: state.newsModel.length ,
                itemBuilder: (BuildContext context, int index) {
              return ItemNews(
                  isNew: index < 3, newsModel: state.newsModel[index]);
            });
          else if (state is LoadingState)
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
