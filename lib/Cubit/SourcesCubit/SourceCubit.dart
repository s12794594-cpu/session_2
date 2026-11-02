import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_2/ApiMananger.dart';
import 'package:session_2/Cubit/SourcesCubit/SourceState.dart';

class sourceCubit extends Cubit<sourceInitState>{
  sourceCubit():super(sourceInitState());
  ApiManager apiManager = ApiManager();
  show_data(String cat_id)async {
   emit(sourceLoadingState());
   try{
    final responce =await  apiManager.get_sources(cat_id);
    emit(sourceSuccessState(responce));
   }
   catch(e){
     emit(sourceErrorState(e.toString()));
       }


  }


}