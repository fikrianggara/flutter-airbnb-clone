import 'package:dicoding_flutter_basic_submission_1/helpers/json_loader.dart';

String localJsonFilePath = 'assets/property.json';

class Property {
  final String id;
  final String title;
  final num? avgRating;
  final String? listingName;
  final String? city;
  final String? publicAddress;
  final int? reviewsCount;
  final List<String>? images;
  final String? price;
  final num? bathrooms;
  final DateTime? checkin;
  final DateTime? checkout;
  final num? bedrooms;
  final num? beds;
  final List<String> listingPreviewAmenityNames;

  Property(
      {required this.id,
      required this.title,
      this.avgRating,
      this.listingName,
      this.city,
      this.publicAddress,
      this.reviewsCount,
      this.images,
      this.price,
      this.bathrooms,
      this.checkin,
      this.checkout,
      this.bedrooms,
      this.beds,
      required this.listingPreviewAmenityNames});

  factory Property.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    final avgRating = json['avgRating'] ?? 0.0;
    final listingName = json['listingName'] ?? 'Unknown';
    final city = json['city'] ?? 'Unknown';
    final publicAddress = json['publicAddress'] ?? 'Unknown';
    final reviewsCount = json['reviewsCount'] ?? 0;
    var images = ['no images'];
    var listingPreviewAmenityNames = ['no amenity'];

    if (json['images'] != null) {
      images = (json['images'] as List)
          .map((dynamic item) => item.toString())
          .toList();
    }
    var now = DateTime.now();
    final price = json['price'] ?? 'Unknown';
    final bathrooms = json['bathrooms'] ?? 0;
    final checkin = json['checkin'] != null
        ? DateTime.parse(json['checkin'])
        : DateTime(now.year, now.month, now.day);
    final checkout = json['checkout'] != null
        ? DateTime.parse(json['checkout'])
        : DateTime(now.year, now.month, now.day + 1);
    final bedrooms = json['bedrooms'] ?? 0;
    final beds = json['beds'] ?? 0;

    if (json['listingPreviewAmenityNames'] != null) {
      listingPreviewAmenityNames = (json['listingPreviewAmenityNames'] as List)
          .map((dynamic item) => item.toString())
          .toList();
    }

    return Property(
        id: id,
        title: title,
        avgRating: avgRating,
        listingName: listingName,
        city: city,
        publicAddress: publicAddress,
        reviewsCount: reviewsCount,
        images: images,
        price: price,
        bathrooms: bathrooms,
        checkin: checkin,
        checkout: checkout,
        bedrooms: bedrooms,
        beds: beds,
        listingPreviewAmenityNames: listingPreviewAmenityNames);
  }
}

Future<List<Property>> fetchProperty() async {
  var rawProperty = await loadLocalJson(localJsonFilePath);

  try {
    // parsing data dari json ke class property
    List<Property> properties = (rawProperty['data'] as List)
        .map((property) => Property.fromJson(property as Map<String, dynamic>))
        .toList();
    return Future.delayed(const Duration(seconds: 1), () {
      return properties;
    });
  } catch (e) {
    throw Exception(e);
  }
}
