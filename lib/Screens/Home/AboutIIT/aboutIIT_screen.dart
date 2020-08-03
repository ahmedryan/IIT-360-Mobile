import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/history_screen.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/institution_screen.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/objective_screen.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/staff_screen.dart';

import 'file:///C:/Users/Hp/AndroidStudioProjects/iit_app_development/lib/Screens/Home/AboutIIT/Faculty/faculty_screen.dart';

class AboutIIT extends StatefulWidget {
  @override
  _AboutIITState createState() => _AboutIITState();
}

class _AboutIITState extends State<AboutIIT> {
  List<AboutIITCardModel> cards = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cards.add(
        AboutIITCardModel(text: 'Institution', nextRoute: InstitutionScreen()));
    cards.add(AboutIITCardModel(text: 'Staff', nextRoute: StaffScreen()));
    cards.add(AboutIITCardModel(text: 'Faculty', nextRoute: FacultyScreen()));
    cards.add(
        AboutIITCardModel(text: 'Objective', nextRoute: ObjectiveScreen()));
    cards.add(AboutIITCardModel(text: 'History', nextRoute: HistoryScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50,
              child: Swiper(
                //viewportFraction: 0.5,
                autoplay: true,
                autoplayDelay: 5000,
                itemCount: cards.length,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height,
                layout: SwiperLayout.TINDER,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(),
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return cards[index].nextRoute;
                                }),
                              );
                            },
                            child: Card(
                              elevation: 16.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        400,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Text(
                                    cards[index].text,
                                    style: TextStyle(
                                        fontSize: 44,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutIITCardModel {
  final String text;
  final image;
  final Widget nextRoute;

  AboutIITCardModel({this.text, this.image, this.nextRoute});
}
