import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  //list image preview
  List imagePreview=[
    {"image":"assets/netflix-movie1.jpg","title":"Imperial Dreams","color":Colors.orangeAccent},
    {"image":"assets/netflix-movie2.jpg","title":"Quick Sands","color":Colors.white},
    {"image":"assets/netflix-movie3.jpg","title":"The Haunting","color":Colors.grey},
    {"image":"assets/netflix-movie4.jpg","title":"The Irishman","color":Colors.orangeAccent},
    {"image":"assets/netflix-movie5.jpg","title":"Extention","color":Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: pageChange(),
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
          onTap:(int index){
            setState(() {
              this.index=index;
            });
          } ,
        ),
      ),
    );
  }
  /*handle event click page*/
  Widget pageChange(){
    if(this.index==0){
      return widgetList();
    }
    return Container();
  }

  Widget widgetList(){
    return Column(
      children: [
        Stack(
          children: [
            /*list view widget*/
            mainView(),
            headerMenu(),
          ],
        ),
            preview()
      ],
    );
  }

  //header menu
  Widget headerMenu(){
    return Positioned(
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Container(
          child:Image.asset("assets/netflix_logo.png",height: 0,width: 20,),

        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20,top: 20),
              child: Text("TV Programmes",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20,top: 20),
              child: Text("Films",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20,top: 20),
              child: Text("My List",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }


  Widget mainView(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/netflix-series3.jpg",),

        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Padding(
            padding: EdgeInsets.only(top: 300),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2))
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/netflix_logo.png",height: 20,width: 20,),
                      Text("SERIES",style: TextStyle(color:Colors.white70),)
                    ],
                  ),
                  Text("13 REASONS\n WHY",textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ) ,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Drama",style: TextStyle(color: Colors.white70)),
                      Padding(
                        padding: EdgeInsets.only(left: 10,right:10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.red,
                          ),
                          height: 5,
                          width: 5,
                        ),
                      ),
                      Text("Myster",style: TextStyle(color: Colors.white70)),
                      Padding(
                        padding: EdgeInsets.only(left: 10,right:10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.red,
                          ),
                          height: 5,
                          width: 5,
                        ),
                      ),
                      Text("Teen",style: TextStyle(color: Colors.white70)),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 25,right: 25),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Icon(Icons.add,color: Colors.white,),
                        Text("My List" ,style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),

                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Colors.white,
                          ),
                          child: Center(

                            child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow),
                                  Text("Play" ,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline,color: Colors.white,),
                            Text("Info" ,style: TextStyle(color: Colors.grey,fontSize: 14,),),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
  Widget preview(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10,top: 10),
          child: Text("Preview",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            itemCount: imagePreview.length,
            padding: EdgeInsets.only(top: 10,left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imagePreview[index]["image"]),
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.8),
                                spreadRadius: 10,
                                blurRadius: 5,
                                offset: Offset(0,5),
                              ),
                            ],
                          ),
                          child: Text(imagePreview[index]["title"],style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },),
        ),
      ],
    );
  }
}
