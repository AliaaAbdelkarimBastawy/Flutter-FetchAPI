import 'package:chat_app_project/API/MovieAPI.dart';
import 'package:chat_app_project/API/UserAPI.dart';
import 'package:chat_app_project/Constants.dart';
import 'package:chat_app_project/Screens/ChannelsScreen.dart';
import 'package:chat_app_project/Screens/ChatScreen.dart';
import 'package:chat_app_project/Screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/MovieModel.dart';
import '../Models/UserModel.dart';

class BottomNavMainScreen extends StatefulWidget {
  int _selectedIndex = 0;
  BottomNavMainScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavMainScreen> createState() => _BottomNavMainScreenState();
}

class _BottomNavMainScreenState extends State<BottomNavMainScreen> {
  final TextEditingController _searchController = TextEditingController();
 List<Widget> ScreensList = [ChatScreen(), ChannelScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider(create: (context) => Model(),child:
    Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body:Consumer<Model>(builder: (BuildContext context, Model value, Widget? child)
    {
      return ScreensList[value.selectedIndex];
    }),

      bottomNavigationBar:BottomNavigationBarExample(),
    ),
    );
  }
}

class CardItem extends StatelessWidget {
  final AsyncSnapshot snapshot;

  CardItem(
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


class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (BuildContext context, Model value, Widget? child)
        => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wifi_channel),
                label: 'Channels',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            onTap: (int index)
          {
            value.changeName(index);
            _onItemTapped(index);
          },
          )
    );
  }
}


class Model extends ChangeNotifier
{
  int selectedIndex = 0;
  changeName (int index)
  {
    selectedIndex = index;
    notifyListeners();
  }
}