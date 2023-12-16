import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double indent;
  final double endIndent;
  final double margin;

  const CustomDivider(
      {Key? key, this.indent = 0, this.endIndent = 0, this.margin = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: margin,
        ),
        Divider(
          color: Colors.grey[400],
          height: 1,
          thickness: 1,
          indent: indent,
          endIndent: endIndent,
        ),
        SizedBox(
          height: margin,
        ),
      ],
    );
  }
}
