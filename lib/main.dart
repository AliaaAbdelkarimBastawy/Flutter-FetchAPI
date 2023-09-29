import 'package:chat_app_project/Screens/ChannelsScreen.dart';
import 'package:chat_app_project/Screens/ChatScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/BottomNavMainScreen.dart';
import 'Screens/ProfileScreen.dart';

void main() {
  // runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ChatScreen(),));


  runApp( MaterialApp(initialRoute: "/",
 routes: {
    "/" : (context) => BottomNavMainScreen(),
    "/Chat" : (context) =>  ChatScreen(),
    "/Channel" : (context) => ChannelScreen(),
   "/Profile" : (context) => ProfileScreen(),

 },
    debugShowCheckedModeBanner: false,
 ));
}
