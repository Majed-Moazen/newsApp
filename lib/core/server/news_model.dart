import 'package:intl/intl.dart';

class NewsModel {
  String source;
  String title;
  String description;
  String? urlToImage;
  String dateTime;
  String urlLogoImage='images/cnn.jpg';
  NewsModel(
      {required this.source, required this.title, required this.dateTime, required this.description, required this.urlToImage, this.urlLogoImage='images/cnn.jpg'});

  factory NewsModel.fromJson(Map<String, dynamic> data) {
    return NewsModel(
      title: data['title'],
      description: data['description'] ,
      source: data['source']['name'] ,
      urlToImage: data['urlToImage'] ,
      dateTime:DateFormat("MMM dd.yyyy").format(DateTime.parse(data['publishedAt'])),
    );
  }
}
