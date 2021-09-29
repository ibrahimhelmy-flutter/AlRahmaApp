import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProfileScreenView extends StatefulWidget {
  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  getAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.0),
      child: AppBar(
        backgroundColor: Colors.green,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.green, statusBarIconBrightness: Brightness.light),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios),
              Text(
                "كفالة يتيم",
                style: TextStyle(
                    height: 0.9, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Icon(Icons.share),
            ],
          ),
        ),
      ),
    );
  }

  getBody() {
    var des =
        "اشترى عثمان رضي الله عنه بئر روما و حفره لأهل المدينة وجعله وقفاً و ولم يكن لديهم مصدر آخر للمياه العذبة. اشترى الأرض المجاورة لمسجد الرسول صلى الله عليه وسلم لتوسيعها ، وكان معظم ثروته للصدقة ، من أجل استيعاب الاعداد المتزايدة في الاقبال على العبادة. كل عمل من أعمال الصدقة هذه قام به بعد مناشدة صريحة من النبي صلى الله عليه وسلم إلى المجتمع المجاهد ، يليها الوعد النبوي بالجنة لمن يعطي";
    var listOfNotation = [5, 10, 15, 20];
    var size = MediaQuery.of(context).size;
    var options = CarouselOptions(
      viewportFraction: 0.99,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      height: size.height,
    );
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            getImage(size, options),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "مبادره فك كرب محتاج 500 من ولاية مسقط وضواحيها",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                height: 0.9),
                          ),
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            primary: Colors.green,
                          ),
                          label: Text("8${" "}days "),
                          onPressed: () {},
                          icon: Icon(Icons.alarm),
                        )
                      ]),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset("assets/images/Group 1737999.png"),
                      SizedBox(width: 10),
                      Text("8%")
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "الهدف:- ",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text("7000 ريال عمانى ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("    متبقى:- ",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold)),
                      Text("500 ريال عمانى  ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  Text(
                    "وصف المبادرة",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    des,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "مبلغ التبرع",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                          4,
                              (index) => Container(
                            width: (size.width) / 3.5,
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "${listOfNotation[index]} ريال عمانى",
                              maxLines: 1,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        label: Text(
                          "  او ادخل مبلغ التبرع بالريال العمانى ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 15),
                  Row(children: [
                    Container(
                      width: (size.width - 60) / 2,
                      height: 50,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/hand.png"),
                          Text(
                            "تبرع الأن",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (size.width - 60) / 2,
                      height: 50,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "اضافة للسلة التبرعات",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ])    ,
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ));
  }

  Container getImage(Size size, CarouselOptions options) {
    return Container(
      height: 200,
      child: CarouselSlider(
        items: List.generate(9, (index) {
          return Stack(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/image33.png",
                  width: size.width,
                  height: 200,
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
    );
  }
}
