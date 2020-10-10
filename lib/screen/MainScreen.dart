import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(),
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                  color: (index == 0) ? Colors.white : Colors.grey,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 8,
                      color: (index == 0) ? Colors.white : Colors.grey),
                )
            ),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 20,
                  color: (index == 0) ? Colors.white : Colors.grey,
                ),
                title: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 8,
                      color: (index == 0) ? Colors.white : Colors.grey),
                )),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.queue_play_next,
                  size: 20,
                  color: (index == 0) ? Colors.white : Colors.grey,
                ),
                title: Text(
                  "Coming Soon",
                  style: TextStyle(
                      fontSize: 8,
                      color: (index == 0) ? Colors.white : Colors.grey),
                )),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_download,
                  size: 20,
                  color: (index == 0) ? Colors.white : Colors.grey,
                ),
                title: Text(
                  "Download",
                  style: TextStyle(
                      fontSize: 8,
                      color: (index == 0) ? Colors.white : Colors.grey),
                )),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.toc,
                  size: 20,
                  color: (index == 0) ? Colors.white : Colors.grey,
                ),
                title: Text(
                  "More",
                  style: TextStyle(
                      fontSize: 8,
                      color: (index == 0) ? Colors.white : Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
