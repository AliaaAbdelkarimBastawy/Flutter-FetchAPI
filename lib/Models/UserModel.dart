// "adult": false,
// "id": 5658,
// "name": "Michael Gambon",
// "original_name": "Michael Gambon",
// "media_type": "person",
// "popularity": 47.702,
// "gender": 2,
// "known_for_department": "Acting",
// "profile_path": "/3jdWkDKf4IODbG4JKTeaC7AzxZH.jpg",
// "known_for": [
// {
// "adult": false,
// "backdrop_path": "/obKmfNexgL4ZP5cAmzdL4KbHHYX.jpg",
// "id": 673,
// "title": "Harry Potter and the Prisoner of Azkaban",
// "original_language": "en",
// "original_title": "Harry Potter and the Prisoner of Azkaban",
// "overview": "Year three at Hogwarts means new fun and challenges as Harry learns the delicate art of approaching a Hippogriff, transforming shape-shifting Boggarts into hilarity and even turning back time. But the term also brings danger: soul-sucking Dementors hover over the school, an ally of the accursed He-Who-Cannot-Be-Named lurks within the castle walls, and fearsome wizard Sirius Black escapes Azkaban. And Harry will confront them all.",
// "poster_path": "/aWxwnYoe8p2d2fcxOqtvAtJ72Rw.jpg",
// "media_type": "movie",
// "genre_ids": [
// 12,
// 14
// ],
// "popularity": 124.386,
// "release_date": "2004-05-31",
// "video": false,
// "vote_average": 8.02,
// "vote_count": 20038

class User {
  String Name;
  String ProfilePath;
  String Department;
  String ReleaseDate;

  User({
    required this.Name,
    required this.ProfilePath,
    required this.Department,
    required this.ReleaseDate,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return
      User(Name: json["name"] ?? "Default Name",
          ProfilePath: json["profile_path"] ?? "Default Path",
          Department: json["known_for_department"] ?? "Default Department",
          ReleaseDate: json["release_date"] ?? "Default Date");

  }

}