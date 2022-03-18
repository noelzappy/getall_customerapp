import 'package:abg_utils/abg_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ondemandservice/ui/theme.dart';

Widget cateegoryBtn(String text, Color color, String icon, Function _callback,
    double width, double height,
    {TextDirection direction = TextDirection.ltr, double? radius}) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ])),
            Positioned.fill(
                child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              alignment: Alignment.centerRight,
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    splashColor: Colors.black.withOpacity(0.2),
                    onTap: () {
                      _callback();
                    }, // needed
                  )),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              text,
              style: theme.style13W400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: direction == TextDirection.ltr
                  ? TextAlign.left
                  : TextAlign.right,
            ),
          )),
    ],
  );
}
