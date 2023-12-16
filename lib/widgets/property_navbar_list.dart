import 'package:flutter/material.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({super.key});

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  var selectedIndex = 0;
  final List<Map<String, dynamic>> propertyTypes = [
    {"type": "Amazing views", "icon": Icons.wallpaper_outlined},
    {"type": "Rooms", "icon": Icons.bed_rounded},
    {"type": "Beach", "icon": Icons.beach_access_outlined},
    {"type": "OMG", "icon": Icons.card_giftcard_rounded},
    {"type": "Top of the world", "icon": Icons.landscape_outlined},
    {"type": "Amazing views", "icon": Icons.wallpaper_outlined},
    {"type": "Rooms", "icon": Icons.bed_rounded},
    {"type": "Beach", "icon": Icons.beach_access_outlined},
    {"type": "OMG", "icon": Icons.card_giftcard_rounded},
    {"type": "Top of the world", "icon": Icons.landscape_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: propertyTypes.length,
          itemBuilder: (context, index) {
            return Material(
                type: MaterialType.transparency,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.only(right: 6, left: 6, top: 6),
                      decoration: selectedIndex == index
                          ? const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                            )
                          : null,
                      child: Column(
                        children: [
                          Icon(
                            propertyTypes[index]['icon'],
                            color: Colors.grey,
                            weight: 100,
                          ),
                          const SizedBox(height: 6),
                          Expanded(
                              child: Text(
                            propertyTypes[index]['type'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: (index == selectedIndex)
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )),
                        ],
                      )),
                ));
          }),
    );
    // return Placeholder();
  }
}
