import 'package:chat_app_project/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/UserModel.dart';

class UserAPI
{
  static const _trendingURL = "https://api.themoviedb.org/3/trending/person/day?api_key=${Constants.apiKey}";

  //I am going to have some data in the future
  Future<List<User>> getTrendingUsers() async
  {
    //Wait for the response until it comes
    final response = await http.get(Uri.parse(_trendingURL));
    if(response.statusCode == 200)
    {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((user) => User.fromJson(user)).toList();
    }
    else {
      throw Exception('Something Happened!');
    }

  }
}