import 'package:chat_app_project/API/MovieAPI.dart';
import 'package:chat_app_project/API/UserAPI.dart';
import 'package:chat_app_project/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/MovieModel.dart';
import '../Models/UserModel.dart';
import 'ChatScreen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _searchController = TextEditingController();

  late Future <List<Movie>> FetchedData;
  // late Future <List<User>> FetchedData;

  @override
  void initState() {
    super.initState();
    FetchedData = MovieAPI().getTrendingMovies();
    // FetchedData = UserAPI().getTrendingUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Container(child:Row(
              children: [
                Text(
                  "Conversations",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  width: 80,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFfee6ed),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  width: 90,
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.add, color: Color(0xFFf73772),),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Add")
                    ],
                  ),
                ),

              ],
            ),),



            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // Add padding around the search bar
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // Use a Material design search bar
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 570,
              width: double.infinity,
              // child: ListView.separated(
              //   itemCount: 10,
              //   itemBuilder:(context, index) {
              //           return ChatCardItem
              //             (UserImageURL: '',
              //             UserName: 'Kriss',
              //             UserMessage: 'Hello,Friend',
              //             MessageDate: 'Today',);
              //   }, separatorBuilder: (BuildContext context, int index) {
              //   return Column(children: [
              //     Container(height: 3,),
              //     SizedBox(height: 10,)
              //   ],);
              // },
              // ),
              child: SizedBox(
                child: FutureBuilder(future:FetchedData,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasError)
                    {
                      return Center(child: Text(snapshot.error.toString()),);
                    }

                    else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
                    {
                      return UserCardItem(snapshot: snapshot);
                    }

                    else {
                      return const Center (child:  CircularProgressIndicator(),);
                    }

                  },),
              ),
            ),

          ],)
      ),
    );
  }
}


class UserCardItem extends StatelessWidget {
  final AsyncSnapshot snapshot;

  UserCardItem(
      {Key? key,
        required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder:(context, index) {
            return Card(
              elevation: 20,
              child: Container(
                height: 100,
                color: Colors.white,
                child: Center(
                  child: ListTile(
                      leading: Container(color: Colors.tealAccent, width: 60,
                        height: 60,child: Image.network(filterQuality:FilterQuality.high,
                            fit: BoxFit.cover,
                            "${Constants.imagePath}${snapshot.data[index].PosterPath}"
                        ),),
                      title: Text(
                        snapshot.data[index].title,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle:   Text(
                        snapshot.data[index].MediaType,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data[index].releaseDate,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      )

                  ),
                ),
              ),
            );

          },
        ),
      ),
    );


  }
}
