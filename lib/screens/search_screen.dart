import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 0;
  static List<int> mapDummy = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey[500]!,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(1000))),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_outlined),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                },
                                child: Container(
                                    decoration: selectedIndex == 0
                                        ? const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                            color: Colors.black,
                                            width: 3,
                                          )))
                                        : const BoxDecoration(),
                                    child: Text('Tempat menginap',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: selectedIndex == 0
                                                ? Colors.black
                                                : Colors.grey[600],
                                            fontWeight: FontWeight.w600))),
                              ),
                              const SizedBox(height: 16),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () => {
                                        setState(() {
                                          selectedIndex = 1;
                                        })
                                      },
                                  child: Container(
                                      decoration: selectedIndex == 1
                                          ? const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                              color: Colors.black,
                                              width: 3,
                                            )))
                                          : const BoxDecoration(),
                                      child: Text('Pengalaman',
                                          style: TextStyle(
                                              color: selectedIndex == 1
                                                  ? Colors.black
                                                  : Colors.grey[600],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)))),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        // height: 300,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 26),
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400]!,
                                blurRadius: 26,
                                offset: const Offset(0, 8), // Shadow position
                              ),
                            ],
                            color: Colors.white,
                            border: Border.all(width: 0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ingin ke mana?',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    border: Border.all(width: 0.5)),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Cari destinasi",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      icon: Icon(Icons.search_outlined)),
                                )),
                            SizedBox(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: mapDummy.map((item) {
                                  return Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(26),
                                    margin: const EdgeInsets.only(
                                        top: 26, right: 26, bottom: 26),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: const Center(
                                      child: Text('world map'),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 26),
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[350]!,
                                blurRadius: 5,
                                offset: const Offset(0, 2), // Shadow position
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Expanded(child: ,)
                              Expanded(
                                  child: Text(
                                'Tanggal Perjalanan',
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              )),
                              Expanded(
                                  child: Text('Tambahkan Tanggal',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)))
                            ]),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 26),
                          padding: const EdgeInsets.all(26),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[350]!,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2), // Shadow position
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Expanded(child: ,)
                                Expanded(
                                    child: Text(
                                  'Peserta',
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                )),
                                Expanded(
                                    child: Text('Tambahkan Tamu',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)))
                              ]))
                    ],
                  )))),
      bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            color: Colors.grey[100],
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
              const Text('Hapus semua',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline)),
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
                      child: const Text('Cari',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600))))
            ],
          )),
    );
  }
}
