import 'package:abg_utils/abg_utils.dart';
import 'package:flutter/material.dart';

Widget cateegoryBtn(String text, Color color, String icon, Function _callback,
    double width, double height,
    {TextDirection direction = TextDirection.ltr, double? radius}) {
  return Stack(
    children: <Widget>[
      Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(top: 20),
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
              // padding: EdgeInsets.only(right: 10, left: 10),
            ),
          ])),
      Positioned.fill(
          child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        // alignment: strings.direction == TextDirection.ltr ? Alignment.centerRight : Alignment.centerLeft,

        //  Container(
        //     margin: direction == TextDirection.ltr
        //         ? EdgeInsets.only(right: width * 0.4, top: 20)
        //         : EdgeInsets.only(left: width * 0.4, top: 20),
        //     alignment: direction == TextDirection.ltr
        //         ? Alignment.centerLeft
        //         : Alignment.centerRight,
        //     child: Text(
        //       text,
        //       maxLines: 2,
        //       overflow: TextOverflow.ellipsis,
        //       textAlign: direction == TextDirection.ltr
        //           ? TextAlign.left
        //           : TextAlign.right,
        //     ),
        //   )

        child: Container(
            // alignment: direction == TextDirection.rtl
            //     ? Alignment.bottomRight
            //     : Alignment.bottomLeft,
            child: showImage(icon,
                width: height,
                alignment: direction == TextDirection.rtl
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft)),
      )),
      Positioned.fill(
        child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              splashColor: Colors.black.withOpacity(0.2),
              onTap: () {
                _callback();
              }, // needed
            )),
      )
    ],
  );
}
