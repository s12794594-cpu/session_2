import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_2/ApiMananger.dart';
import 'package:session_2/Cubit/ArticlesCubit/ArticleState.dart';
class articleCubit extends Cubit<articleInitState>{
  articleCubit():super(articleInitState());
  ApiManager apiManager =ApiManager();
  show_articles(String source_id)async {
    emit(articleLoadingState());
    try{
      final response = await apiManager.get_articles(source_id);
      emit(articleSuccessState(response));
      print(response.status);
    }
        catch(e){
       emit(articleErrorState(e.toString()));
        }
  }

}