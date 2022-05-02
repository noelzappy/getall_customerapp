import 'dart:ffi';

import 'package:abg_utils/abg_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ondemandservice/ui/theme.dart';

Widget newCategoryBtn(String text, Color color, String icon, Function _callback,
    double width, double height,
    {TextDirection direction = TextDirection.ltr, double? radius}) {
  return SizedBox.fromSize(
    size: Size(width, height), // button width and height

    child: Material(
        color: color, // button color
        borderRadius: BorderRadius.circular(width * 0.02),
        child: Container(
          padding: EdgeInsets.only(
            left: width * 0.05,
          ),
          child: InkWell(
            splashColor: Colors.white, // splash color
            onTap: () {
              _callback();
            }, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        child: CachedNetworkImage(
                            imageUrl: icon,
                            errorWidget: (
                              BuildContext context,
                              String url,
                              dynamic error,
                            ) {
                              return Icon(Icons.error);
                            },
                            placeholder: (context, url) => UnconstrainedBox(
                                    child: Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    color: aTheme.mainColor,
                                  ),
                                )),
                            imageBuilder: (context, imageProvider) => Container(
                                  width: width * 0.08,
                                  margin: EdgeInsets.only(right: 20),
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: width,
                                    height: height,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain,
                                    )),
                                  ),
                                ))),
                    Expanded(
                      child: Text(text,
                          style: aTheme.style12W800W,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
  );

  //
  //
  //   Stack(
  //   children: <Widget>[
  //
  //     Container(
  //         width: width,
  //         height: height,
  //         margin: EdgeInsets.only(top: 20),
  //         child: Stack(
  //             children: <Widget>[
  //
  //               // Container(
  //               //   decoration: BoxDecoration(
  //               //     color: color,
  //               //     borderRadius: BorderRadius.circular(radius ?? aTheme.radius),
  //               //   ),
  //               //   // padding: EdgeInsets.only(right: 10, left: 10),
  //               // ),
  //
  //             ])
  //     ),
  //
  //     Positioned.fill(
  //         child: Container(
  //             width: double.maxFinite,
  //             margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
  //             // alignment: strings.direction == TextDirection.ltr ? Alignment.centerRight : Alignment.centerLeft,
  //             child: Stack(
  //               children: [
  //
  //                 Container(
  //                     alignment: Alignment.centerLeft,
  //                     child: showImage(icon, width: height * 0.5,
  //                         alignment:  Alignment.centerLeft )
  //
  //                 ),
  //
  //
  //                 Container(
  //                   margin: direction == TextDirection.ltr ? EdgeInsets.only(right: width*0.4, top: 20)
  //                       : EdgeInsets.only(left: width*0.4, top: 20),
  //                   alignment: Alignment.centerLeft ,
  //                   child: Text(text, style: aTheme.style12W800, maxLines: 2, overflow: TextOverflow.ellipsis,
  //                     textAlign: TextAlign.left),
  //                 ),
  //
  //
  //
  //               ],
  //             )
  //         )),
  //
  //     Positioned.fill(
  //       child: Material(
  //           color: Colors.transparent,
  //           clipBehavior: Clip.hardEdge,
  //           shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(radius ?? aTheme.radius) ),
  //           child: InkWell(
  //             splashColor: Colors.black.withOpacity(0.2),
  //             onTap: (){
  //               _callback();
  //             }, // needed
  //           )),
  //     )
  //   ],
  // );
}
