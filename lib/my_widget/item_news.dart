import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/server/news_model.dart';
import 'package:news_app/screens/news_screen.dart';

class ItemNews extends StatelessWidget {
  const ItemNews({
    super.key,
    required this.isNew,
    required this.newsModel,
  });

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
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 8)]),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
                imageUrl: newsModel.urlToImage ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            newsModel.urlLogoImage,
                          ),
                          radius: 8,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          newsModel.source,
                          style: const TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Text(
                      newsModel.title,
                      style: const TextStyle(fontSize: 30),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      newsModel.dateTime,
                      style: const TextStyle(
                          color: Colors.grey, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
