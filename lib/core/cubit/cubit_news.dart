import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/server/manager.dart';

import 'cubti_state.dart';

class CubitNews extends Cubit<CubitState> {
  CubitNews() : super(InitState());
  void getDataNews()
 async {
    try {
      emit(LoadingState());
      ServerManager serverManager = ServerManager();
      await serverManager.getNews();
      emit(LoadedSuccessState(newsModel: serverManager.newsModelList));
    }
    catch(e){
      emit(LoadedErrorState(error: e.toString()));
    }
  }
}
