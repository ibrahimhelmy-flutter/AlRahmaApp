import 'package:flutter/material.dart';
import 'package:untitled/first_screen.dart';
import 'package:untitled/second_screen.dart';

class HomeView extends StatefulWidget{
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var currentIndex = 0;

  List itemList = [
    {"name": "التبرعات", "icon": "assets/images/outline.png"},
    {"name": "المبادرات", "icon": "assets/images/Group 16854.png"},
    {"name": "ألأخبار", "icon": "assets/images/Group 88073.png"},
    {"name": "السلة", "icon": "assets/images/Group 88073.png"},
    {"name": "البروفايل", "icon": "assets/images/user.png"},
  ];

  List<Widget> getScreens() {
    return [
      FirstScreenView(),
      _getScreen("المبادرات"),

      _getScreen("   ألأخبار    "),
      _getScreen("السلة"),
      ProfileScreenView(),
      // ProfileScreenView(),
    ];
  }

  void changeCurrentIndex({newIndex}) {
    setState(() {
      currentIndex = newIndex;
    });
  }



  _getScreen(String s) {
    return Center(
        child: Text(
          s,
          style: TextStyle(color: Colors.black),
        ));
  }




  @override
  Widget build(BuildContext context){
  return Scaffold(

      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => changeCurrentIndex(newIndex: 2),
          child : Image.asset(
              "assets/images/2330100.png",
              color: currentIndex == 2
                  ? Colors.green
                  : Colors.grey,
            ),
          backgroundColor: Colors.white),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  getFooter() {
    return Card(
      elevation: 20,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 12, bottom: 20, right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(itemList.length,
                (index) {
              var item = itemList[index];

              return GestureDetector(
                onTap: () => changeCurrentIndex(newIndex: index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index == 2
                        ? Container(
                      height: 20,
                    )
                        :
                  Container(
                        height: 25,
                        width: 25,

                        child: Image.asset(
                          item['icon'],
                          fit: BoxFit.contain,
                          color: currentIndex == index
                              ? Colors.green
                              : Colors.grey,

                        ),
                      ),


                    Padding(
                     padding:  EdgeInsets.only(left:index == 2? 15:0),
                      child: Text(
                          item['name'],
                          style: TextStyle(
                            color: currentIndex == index
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  getBody() {
    return getScreens()[currentIndex];
  }
}