import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/server/news_model.dart';

class ServerManager {
  List<NewsModel> newsModelList = [];
  List<NewsModel> newsModelHeadLineList = [];

  Future<void> getNewsEverything() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&apiKey=da887f5db2054e6f820c5b648c818a4c'));
    Map<String, dynamic> newsBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(newsBody['articles']);
      for (int index = 0; index < 15; index++) {
        newsModelList.add(NewsModel.fromJson(newsBody['articles'][index]));
      }
    } else {
      throw (newsBody['message']);
    }
  }

  Future<void> getNewsHeadline() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=da887f5db2054e6f820c5b648c818a4c'));
    Map<String, dynamic> newsBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(newsBody['articles']);
      for (int index = 0; index < 15; index++) {
        newsModelHeadLineList.add(NewsModel.fromJson(newsBody['articles'][index]));
      }
    } else {
      throw (newsBody['message']);
    }
  }
}
