import 'package:dio/dio.dart';
import 'package:session_2/ArticleModel.dart';
import 'package:session_2/SourceModel.dart';
class ApiManager {
  Dio dio =Dio();
  get_sources(String cat_id)async {
    final response = await dio.get("https://newsapi.org/v2/top-headlines/sources",
        queryParameters:{

          "apiKey":"be58ace92ecf45159485f4bcda072075",
          "category":cat_id

        } );
   return SourceModel.fromJson(response.data);
  }
  Future<ArticleModel> get_articles(String source_id )async{
   final response = await dio.get("https://newsapi.org/v2/top-headlines",
       queryParameters: {
    "apiKey":"be58ace92ecf45159485f4bcda072075",
         "sources": source_id
    });
   print(response.statusCode);

   return ArticleModel.fromJson(response.data);
  }
}