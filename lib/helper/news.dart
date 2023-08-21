import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news = [];
  
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=my&category=business&apiKey=020b8e0139204b7bb8d7e9c10ec3df08";

  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

  if (jsonData['status'] == 'ok'){
    jsonData['articles'].forEach((element){

      if(element["urlToImage"] != null && element["description"] != null && element["content"] != null){

        ArticleModel articleModel = ArticleModel()
      }
    })
  }
  }
  

}