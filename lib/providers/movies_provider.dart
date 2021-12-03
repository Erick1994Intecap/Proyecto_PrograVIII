import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cartelera/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    getOnDisplayMovies();
  }
  final String _apiKey = "d070e0fd80422b7ae7c2736a6da2b92e";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  void getNowMovies() async {
    //Llamado al API
    final url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    print(response.body);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[0].posterPath);
    //print(nowPlayingResponse.results[0].title);
    //notifyListeners();
  }

  //Future obtener async
  Future<NowPlayingResponse> getOnDisplayMovies() async {
    //Llamado al API
    final url =
        Uri.https(_baseUrl, '3/movie/now_playing', //'3/movie/580489', //
            {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ok
      return NowPlayingResponse.fromJson(response.body);
    } else {
      print(response.statusCode);
      throw Exception("Fail");
    }
  }

  Future<Movie> getMovie(int index) async {
    //Llamado al API
    final url =
        Uri.https(_baseUrl, '3/movie/$index', //'3/movie/now_playing', //
            {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ok
      return Movie.fromJson(response.body);
    } else {
      print(response.statusCode);
      throw Exception("Fail");
    }
  }
}
