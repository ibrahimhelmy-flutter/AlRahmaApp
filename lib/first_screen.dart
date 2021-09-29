import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreenView extends StatefulWidget {
  @override
  State<FirstScreenView> createState() => _FirstScreenViewState();
}

class _FirstScreenViewState extends State<FirstScreenView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppbar(),
      body: getBody(context),
    );
  }

  getAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.0),
      child: AppBar(
        backgroundColor: Colors.green,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor:  Colors.green, statusBarIconBrightness: Brightness.light),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/Alrahma.png"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "جمعية الرحمة \nللأمومة والطفولة",
                    style: TextStyle(
                        height: 0.9, fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/Group 88062.png")),
                  const SizedBox(width: 15),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/Group 88252.png"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  var currentIndex = 0;

  CarouselController buttonCarouselController = CarouselController();

  changeCurrentIndex({newIndex}) {
   setState(() {
     currentIndex = newIndex;
   });
  }

  List?
  items = [
    {"img": "assets/images/image2.png"},
    {"img": "assets/images/image2.png"},
    {"img": "assets/images/image2.png"},
    {"img": "assets/images/image2.png"},

  ];

  getBody(context) { var size = MediaQuery.of(context).size;
    var options = CarouselOptions(
        viewportFraction: 0.99,
        height: size.height,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          changeCurrentIndex(newIndex: index);
        });


    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BuildSectionHeader(title: "الأخبار"),
            Column(
              children: [
                SizedBox(
                  height: 130,
                  child: CarouselSlider(
                    items: List.generate(9, (index) {
                      return Stack(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/image2.png",
                              width: size.width - 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.navigate_before,
                                  color: Colors.white,
                                ),
                                Icon(Icons.navigate_next, color: Colors.white),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                    options: options,
                  ),
                ),
                 Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        9,
                            (index) => Container(
                          margin: const EdgeInsets.only(right: 8, top: 5),
                          height: 8,
                          width: currentIndex == index ? 19 : 8,
                          decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? Colors.green
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                        )),
                  ),

              ],
            ),
            BuildSectionHeader(title: "أبرز المبادرات"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildItemCard(
                  size: size,
                  title: "بناء مسجد",
                  icon: "assets/images/mosque.png",
                  slider: "assets/images/ffd.png",
                ),
                BuildItemCard(
                  size: size,
                  title: "اطعام مسكين",
                  icon: "assets/images/XMLID_85.png",
                  slider: "assets/images/Group 17379.png",
                ),
              ],
            ),
  BuildSectionHeader(title: "أهم التبرعات"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildDonationIem(
                  size: size,
                  title: 'كفالة يتيم',
                  icon: 'assets/images/single-mother-with-child.png',
                ),
                BuildDonationIem(
                  size: size,
                  title: 'صدقة جارية',
                  icon: 'assets/images/charity.png',
                ),
                BuildDonationIem(
                  size: size,
                  title: 'تعليم طالب',
                  icon: 'assets/images/online-course.png',
                ),
              ],
            ),
            BuildSectionHeader(title: "شركاء العطاء"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    10,
                        (index) => Container(
                      width: (size.width - 60) / 3,
                      height: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset("assets/images/image444.png"),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  BuildDonationIem({Size ?size, String? title, String? icon}) {
  return  Container(
      width: (size!.width - 60) / 3,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(icon!), Text(title!)],
      ),
    );
  }

  BuildItemCard({Size? size, String? title, String ?icon, String ?slider}) {
    return Container(
      width: (size!.width - 50) / 2,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Image.asset(icon!),
          Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "سعر السهم",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Image.asset(slider!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "الهدف",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "5000 ر.ع",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "المدفوع",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1000 ر.ع",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}




class BuildSectionHeader extends StatelessWidget {
  const BuildSectionHeader({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(
          child: Text("المزيد ..."),
          onPressed: () {},
        )
      ]),
    );
  }
}


