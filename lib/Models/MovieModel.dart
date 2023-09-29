// "adult": false,
// "backdrop_path": "/xFYpUmB01nswPgbzi8EOCT1ZYFu.jpg",
// "id": 980489,
// "title": "Gran Turismo",
// "original_language": "en",
// "original_title": "Gran Turismo",
// "overview": "The ultimate wish-fulfillment tale of a teenage Gran Turismo player whose gaming skills won him a series of Nissan competitions to become an actual professional racecar driver.",
// "poster_path": "/51tqzRtKMMZEYUpSYkrUE7v9ehm.jpg",
// "media_type": "movie",
// "genre_ids": [
// 28,
// 18,
// 12
// ],
// "popularity": 976.892,
// "release_date": "2023-08-09",
// "video": false,
// "vote_average": 7.894,
// "vote_count": 509

class Movie {
  String title;
  String PosterPath;
  String MediaType;
  String releaseDate;

  Movie({
    required this.title,
    required this.PosterPath,
    required this.MediaType,
    required this.releaseDate,
  });


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        // title: json["title"] ?? "Default title",
        // title: json["title"] as String,
        title: json["title"],
        PosterPath: json["poster_path"] ,
        MediaType: json["media_type"],
        releaseDate: json["release_date"]);
  }

  //-------To Post Data to the API
  // Map<String, dynamic> toJson() => {
  //   "title" : title,
  //
  // };


}
