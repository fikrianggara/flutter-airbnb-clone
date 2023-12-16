// import 'package:dicoding_flutter_basic_submission_1/widgets/navigation.dart';
import 'package:dicoding_flutter_basic_submission_1/helpers/date.dart';
import 'package:dicoding_flutter_basic_submission_1/models/property.dart';
import 'package:dicoding_flutter_basic_submission_1/screens/detail_screen.dart';
import 'package:dicoding_flutter_basic_submission_1/screens/search_screen.dart';
import 'package:dicoding_flutter_basic_submission_1/widgets/favorite.dart';
import 'package:dicoding_flutter_basic_submission_1/widgets/modal.dart';
import 'package:dicoding_flutter_basic_submission_1/widgets/property_navbar_list.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Property>> futureProperties;
  // List<Map<String, dynamic>> = [

  // ]

  @override
  void initState() {
    super.initState();
    futureProperties = fetchProperty();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  // border: Border.fromBorderSide(side),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      spreadRadius: 4,
                      blurRadius: 7,
                    ),
                  ]),
              child: Stack(
                children: [
                  Positioned(
                      width: screenWidth,
                      left: 0,
                      bottom: 0,
                      child: const PropertyList()),
                  Positioned(
                    right: 16,
                    top: 70,
                    child: Material(
                        type: MaterialType.transparency,
                        child: Ink(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              shape: BoxShape.circle,
                            ),
                            child: Modal(
                              contentHeader: const Center(
                                  child: Text('Filter',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20))),
                              trigger: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000.0),
                                ),
                                child: const Icon(
                                  Icons.tune,
                                  color: Colors.black,
                                ),
                              ),
                            ))),
                  ),
                  Positioned(
                    left: 16,
                    right: 72,
                    top: 64,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                        // boxShadow: //create a box shadow
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200]!,
                            spreadRadius: 2,
                            blurRadius: 7,
                          ),
                        ],
                        // border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SearchScreen();
                            }));
                          },
                          child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.search),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('mau kemana ?',
                                        style: TextStyle(color: Colors.black)),
                                    Text('pergi ke manapun',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                )
                              ]))),
                    ),
                  ),
                  // Text('fdsafdsaf')
                ],
              )),
        ),
        body: Center(
            child: FutureBuilder(
                future: futureProperties,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // render list data
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final Property property = snapshot.data![index];
                        return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(property: property);
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 26),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ignore: sized_box_for_whitespace
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: AspectRatio(
                                              aspectRatio: 1 / 1,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      property.images![0],
                                                      fit: BoxFit.cover)))),
                                      const FavoriteButton(),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(property.title,
                                              overflow: TextOverflow.fade,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Icon(Icons.star_rate),
                                              Text('${property.avgRating}')
                                            ],
                                          ))
                                    ],
                                  ),

                                  Text(property.listingName!,
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w400)),

                                  Text(
                                      '${returnMonth(DateTime.now())} ${returnDay(property.checkin!)} - ${returnDay(property.checkout!)}',
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: '${property.price} ',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700)),
                                    TextSpan(
                                        text: 'per malam',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w400))
                                  ])),
                                ],
                              ),
                            ));
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }))

        // bottomNavigationBar: const Navigation(),
        );
  }
}
