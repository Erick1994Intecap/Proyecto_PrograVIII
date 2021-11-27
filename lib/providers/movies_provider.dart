import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  String _apiKey = "d070e0fd80422b7ae7c2736a6da2b92e";
  String _baseUrl = "https://api.themoviedb.org";
  String _language = "es-ES";

  MoviesProvider(){
    this.getOnDisplayMovies();
  }

  void getOnDisplayMovies() async {
    //Llamado al API 
    final url = Uri.https(_baseUrl , '3/movie/now_playing',{
      'api_key' : _apiKey,
      'language': _language,
      'page': 1
    });
  }

}