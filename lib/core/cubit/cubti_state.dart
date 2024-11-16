import 'package:news_app/core/server/news_model.dart';

abstract class CubitState{}
class InitState extends CubitState{}
class LoadingState extends CubitState{}
class LoadedSuccessState extends CubitState{
  LoadedSuccessState({required this.newsModelHeadLine,required this.newsModel});
  List<NewsModel> newsModel;
  List<NewsModel> newsModelHeadLine;
}
class LoadedErrorState extends CubitState{
  LoadedErrorState({required this.error});
  String error;
}