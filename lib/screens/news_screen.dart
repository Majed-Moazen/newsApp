import 'package:flutter/material.dart';
import 'package:news_app/core/server/news_model.dart';
import 'package:news_app/my_widget/appbar_icon.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [
            AppbarIcon(iconData: Icons.backup_outlined),
            AppbarIcon(iconData: Icons.archive_outlined),
          ],
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const AppbarIcon(iconData: Icons.arrow_back_ios_new))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(newsModel.urlLogoImage),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    '${newsModel.source} . ${newsModel.dateTime}',
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  )),
                ],
              ),
              Text(
                newsModel.title,
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: NetworkImage(
                    newsModel.urlToImage ??
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2Fvectors%2Fno-image-available.html&psig=AOvVaw1PPr64TkdZlyNZaesoFYvl&ust=1730843706557000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOD5i7TVw4kDFQAAAAAdAAAAABAE',
                  ),
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                newsModel.description,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 75),
          width: double.infinity,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(
                  width: 5,
                ),
                Text('67k'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.message_outlined),
                SizedBox(
                  width: 5,
                ),
                Text('12k'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.headphones),
              ],
            ),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
