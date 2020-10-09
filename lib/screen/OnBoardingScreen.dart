import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPages = 3;
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
                  body: "Trying to \n join Netflix?",
                    desc:"You can sign up for Netflix in \n the app. We know it's hassle. \n After you're a member, you \ncant start  watching in the app.",
                  color: Color.fromRGBO(83,244,21, 1),
                ),
                _buildPageContent(
                  image: "assets/netflix-2.png",
                  body: "Watch on \n any device?",
                  desc:"Stream on your phone, tablet, laptop, and TV",
                  color: Color.fromRGBO(255, 141, 104, 1),
                ),
                _buildPageContent(
                  image: "assets/netflix-3.png",
                  body: "3,2,1...Download!",
                  desc:"Always have something to watch offline.",
                  color: Color.fromRGBO(195, 169, 255, 1),
                ),
                _buildPageContent(
                  image: "assets/netflix-4.png",
                  body: "No pesky contracts.",
                  desc:"Cancel anytime.",
                  color: Color.fromRGBO(130, 172, 38, 1),
                ),
              ],
            ),
                //Header
            Positioned(
              top: 5,
              left: MediaQuery.of(context).size.width * .03,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .9,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Image.asset('assets/netflix.png'),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              alignment:Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("Help",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("Privacy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
            style: TextStyle(fontSize: 35,fontWeight: FontWeight.w800,color: color),
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
