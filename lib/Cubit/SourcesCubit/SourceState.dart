import 'package:session_2/SourceModel.dart';

class sourceInitState {}

class sourceLoadingState extends sourceInitState{}

class sourceSuccessState extends sourceInitState{
  SourceModel sourceModel ;
  sourceSuccessState(this.sourceModel);
}
class sourceErrorState extends sourceInitState {
  String message ;
  sourceErrorState(this.message);

}
