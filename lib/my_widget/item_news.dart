import 'package:flutter/material.dart';
import 'package:news_app/core/server/news_model.dart';
import 'package:news_app/screens/news_screen.dart';

class ItemNews extends StatelessWidget {
  const ItemNews(
      {super.key, required this.isNew, required this.newsModel, });

  final bool isNew;
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => NewsScreen(
              newsModel: newsModel,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow:const [BoxShadow(color: Colors.grey, blurRadius: 8)]),
        margin:const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        padding:const EdgeInsets.all(16),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsModel.title,
                    style:const TextStyle(fontSize: 30),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    newsModel.description,
                    style:const TextStyle(color: Colors.grey,overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            isNew
                ? const Icon(
                    Icons.local_fire_department,
                    color: Colors.deepOrange,
                    size: 25,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
