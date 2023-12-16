import 'package:dicoding_flutter_basic_submission_1/helpers/date.dart';
import 'package:dicoding_flutter_basic_submission_1/models/property.dart';
import 'package:dicoding_flutter_basic_submission_1/widgets/divider.dart';
import 'package:dicoding_flutter_basic_submission_1/widgets/favorite.dart';
import 'package:dicoding_flutter_basic_submission_1/widgets/modal.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Property property;

  const DetailScreen({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    var ratingStar = <Widget>[];
    for (var i = 0; i < property.avgRating!.floor(); i++) {
      ratingStar.add(const Icon(Icons.star, size: 12, color: Colors.grey));
      ratingStar.add(const SizedBox(width: 6));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Stack(children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: property.images!.map((url) {
                  return Image.network(url,
                      width: screenWidth, fit: BoxFit.cover);
                }).toList(),
              ),
            ),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const FavoriteButton()
                        ]))),
          ]),
          Container(
              padding: const EdgeInsets.only(top: 20, left: 26, right: 26),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(property.title,
                    // textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(width: 10),
                    Text(property.city!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                Text(property.publicAddress!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    )),
                Row(
                  children: [
                    property.bathrooms != null
                        ? (Text('${property.bathrooms.toString()} Kamar mandi',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)))
                        : const SizedBox(),
                    const SizedBox(
                      width: 10,
                    ),
                    property.bathrooms != null
                        ? const Text(
                            '·',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : const SizedBox(),
                    const SizedBox(width: 10),
                    property.bedrooms != null
                        ? (Text('${property.bedrooms.toString()} Kamar tidur',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)))
                        : const SizedBox(),
                    const SizedBox(
                      width: 10,
                    ),
                    property.bathrooms != null
                        ? const Text(
                            '·',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : const SizedBox(),
                    const SizedBox(width: 10),
                    property.beds != null
                        ? (Text('${property.beds.toString()} Ranjang',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)))
                        : const SizedBox(),
                  ],
                ),
              ])),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: IntrinsicHeight(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(property.avgRating.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Row(children: ratingStar.toList())
                  ],
                ),
                const VerticalDivider(
                  indent: 4,
                  endIndent: 4,
                ),
                property.avgRating! > 4
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Favorit',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                          Text('Tamu',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600))
                        ],
                      )
                    : const SizedBox(width: 10),
                const VerticalDivider(
                  indent: 4,
                  endIndent: 4,
                ),
                Text('${property.reviewsCount.toString()} ulasan',
                    style: const TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600)),
              ],
            )),
          ),
          const CustomDivider(indent: 26, endIndent: 26, margin: 26),
          Container(
              margin: const EdgeInsets.all(26),
              child: const Column(
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula volutpat sollicitudin. Phasellus enim neque, imperdiet at dolor nec, tincidunt fringilla eros. Nunc pharetra eget urna sit amet blandit. Maecenas a purus ornare, convallis ligula sit amet, imperdiet ligula. Donec non neque efficitur, tempus neque at, vestibulum augue. Curabitur bibendum posuere leo, quis suscipit mi dapibus nec. Donec rutrum orci vitae est tincidunt bibendum. Pellentesque vitae sem id dui iaculis commodo. Pellentesque id accumsan leo, a dictum ligula. Curabitur non dui non ipsum maximus consectetur vitae at sapien. Donec maximus lacinia aliquam. Phasellus euismod enim ut neque efficitur eleifend. In egestas ultrices diam, a dignissim nunc sollicitudin id. Integer lacinia turpis quis porta molestie. Sed mauris ligula, commodo a accumsan quis, venenatis vitae mi. Phasellus eget arcu placerat, convallis arcu nec, dignissim leo. Suspendisse volutpat augue convallis erat aliquet ornare. Phasellus sit amet felis ex. Aenean vitae venenatis lorem. Quisque auctor sagittis ligula ut molestie. Suspendisse ut gravida massa, vestibulum sollicitudin nisi. Nam malesuada augue enim, sed bibendum dui interdum in. Nam pharetra fringilla eleifend.Praesent sit amet arcu nec lectus cursus dapibus ut vitae est. Mauris quis consequat tellus, ac semper felis. Maecenas consequat accumsan nibh, at consectetur nunc',
                    style: TextStyle(fontWeight: FontWeight.w300),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  SizedBox(height: 10),
                  Modal(
                    contentHeader: Text('Deskripsi',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                    contentBody: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula volutpat sollicitudin. Phasellus enim neque, imperdiet at dolor nec, tincidunt fringilla eros. Nunc pharetra eget urna sit amet blandit. Maecenas a purus ornare, convallis ligula sit amet, imperdiet ligula. Donec non neque efficitur, tempus neque at, vestibulum augue. Curabitur bibendum posuere leo, quis suscipit mi dapibus nec. Donec rutrum orci vitae est tincidunt bibendum. Pellentesque vitae sem id dui iaculis commodo. Pellentesque id accumsan leo, a dictum ligula. Curabitur non dui non ipsum maximus consectetur vitae at sapien. Donec maximus lacinia aliquam. Phasellus euismod enim ut neque efficitur eleifend. In egestas ultrices diam, a dignissim nunc sollicitudin id. Integer lacinia turpis quis porta molestie. Sed mauris ligula, commodo a accumsan quis, venenatis vitae mi. Phasellus eget arcu placerat, convallis arcu nec, dignissim leo. Suspendisse volutpat augue convallis erat aliquet ornare. Phasellus sit amet felis ex. Aenean vitae venenatis lorem. Quisque auctor sagittis ligula ut molestie. Suspendisse ut gravida massa, vestibulum sollicitudin nisi. Nam malesuada augue enim, sed bibendum dui interdum in. Nam pharetra fringilla eleifend.Praesent sit amet arcu nec lectus cursus dapibus ut vitae est. Mauris quis consequat tellus, ac semper felis. Maecenas consequat accumsan nibh, at consectetur nunc',
                    ),
                  ),
                ],
              )),
          const CustomDivider(indent: 26, endIndent: 26, margin: 26),
          Container(
              // padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Fasilitas yang ditawarkan',
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: property.listingPreviewAmenityNames.length,
                    itemBuilder: (context, index) =>
                        Text(property.listingPreviewAmenityNames[index]),
                  ),
                ],
              )),
        ]),
      ),
      bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          //add box decoration
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '${property.price} ',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: 'per malam',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w400)),
                  ])),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                      '${returnMonth(DateTime.now())} ${returnDay(property.checkin!)} - ${returnDay(property.checkout!)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline))
                ],
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                      // color: Color.fromRGBO(205, 38, 38, 1),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 14),
                      child: const Text('Pesan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600))))
            ],
          )),
    );
  }
}
