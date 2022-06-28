
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DropDown extends StatefulWidget {
  final String? chosenvalue;
  final String? hint;
  final List<dynamic>? list;
  final Function ?onchanged;
  final Function? getindex;
  const DropDown(
      {Key? key, this.chosenvalue, this.hint, this.list, this.onchanged, this.getindex}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String chosenvalue;
  @override
  void initState() {
    chosenvalue = widget.chosenvalue!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
       menuMaxHeight: 500.0,
       
      isExpanded: true,
      underline: const SizedBox(),
      // ignore: unnecessary_null_comparison
      hint: chosenvalue == null
          ? Text(
            widget.hint!,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
          : Text(chosenvalue,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
              )),
      items: widget.list!.map((dynamic value) {
        return DropdownMenuItem<dynamic>(
            value: value,
            child: value is String
                ? Center(
                    child: Text(
                    value,
                    style: TextStyle(fontSize: 14.sp),
                  ))
                : Center(
                    child:  Text(
                    value.city,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18.sp),
                  )));
      }).toList(),
      onChanged: (value) {
       setState(() {
         
   
          widget.onchanged!(value);
          value is String ? chosenvalue = value : chosenvalue = value.city ;
          int? index = 0;
          index = widget.list?.indexOf(value);
          widget.getindex!(index);
          });
      },
    );
  }
}
