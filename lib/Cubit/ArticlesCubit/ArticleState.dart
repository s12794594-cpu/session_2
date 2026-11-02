
import 'package:session_2/ArticleModel.dart';

class articleInitState {}

class articleLoadingState extends articleInitState  {}

class articleSuccessState extends articleInitState {
  ArticleModel articleModel ;
  articleSuccessState(this.articleModel);
}
class articleErrorState extends articleInitState {
  String message ;
  articleErrorState(this.message);

}

