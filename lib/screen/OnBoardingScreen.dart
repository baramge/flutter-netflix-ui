import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: [
                _buildPageContent(
                  image: "assets/netflix-1.jpg",
                  body: "trying to \n join Netflix?"
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(
      {String image, String body, String desc, Color color}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image,),
              fit: BoxFit.cover
          )
      ),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:200),
            child: Text(body,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35,fontWeight: FontWeight.w800,color: Colors.white),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            desc,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,height: 1.2,color: Colors.white),
          )
        ],
      ),
    );
  }
}
