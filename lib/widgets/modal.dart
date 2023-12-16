import "package:dicoding_flutter_basic_submission_1/widgets/divider.dart";
import "package:flutter/material.dart";

class Modal extends StatelessWidget {
  final Widget trigger;
  final Widget contentHeader;
  final Widget contentBody;
  const Modal(
      {Key? key,
      this.trigger = const Text(
        'Selengkapnya',
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      this.contentHeader = const Text('-',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      this.contentBody = const Center(
        child: Text('tidak ada konten'),
      )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: InkWell(
            child: trigger,
            onTap: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                backgroundColor: Colors.grey[50],
                builder: (BuildContext context) {
                  return SafeArea(
                      child: Container(
                          padding: const EdgeInsets.all(26),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: const Icon(
                                            Icons.arrow_back_outlined),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    contentHeader
                                  ],
                                ),
                                const CustomDivider(
                                  margin: 16,
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                        child: contentBody)),
                              ],
                            ),
                          )));
                },
              );
            }));
  }
}
