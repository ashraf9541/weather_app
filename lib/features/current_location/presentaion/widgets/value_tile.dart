import 'package:flutter/material.dart';
import 'empty_widget.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
// ignore: must_be_immutable
class ValueTile extends StatelessWidget {
  final String label;
  final String value;
   IconData ?iconData;

   ValueTile(this.label, this.value, {Key? key,  this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color:Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        iconData != null
            ? Icon(
                iconData,
                color:Colors.black,
                size: 20,
              )
            : const EmptyWidget(),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
