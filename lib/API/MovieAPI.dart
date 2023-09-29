import 'package:chat_app_project/Constants.dart';
import '../Models/MovieModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chat_app_project/env/env.dart';


class MovieAPI
{
  static var _trendingURL = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Env.apiKey}";

  //I am going to have some data in the future
  Future<List<Movie>> getTrendingMovies() async
  {
    //Wait for the response until it comes
    final response = await http.get(Uri.parse(_trendingURL));
    if(response.statusCode == 200)
      {
        final decodedData = json.decode(response.body)['results'] as List;
        // print(decodedData);
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      }
    else {
      throw Exception('Something Happened!');
    }

  }
}