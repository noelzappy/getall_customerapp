import 'package:abg_utils/abg_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ondemandservice/model/model.dart';
import 'package:ondemandservice/ui/service_item.dart';
import 'package:ondemandservice/widgets/buttons/categoryBtn.dart';
import 'package:ondemandservice/widgets/buttons/newCategoryBtn.dart';
import 'strings.dart';
import 'theme.dart';
import 'package:provider/provider.dart';

class AllCategoriesScreen extends StatefulWidget {
  @override
  _AllCategoriesScreenState createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  double windowWidth = 0;
  double windowHeight = 0;
  final ScrollController _scrollController = ScrollController();
  final _controllerSearch = TextEditingController();
  String _searchText = "";
  late MainModel _mainModel;

  @override
  void initState() {
    _mainModel = Provider.of<MainModel>(context, listen: false);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  double _scroller = 20;
  _scrollListener() {
    var _scrollPosition = _scrollController.position.pixels;
    _scroller = 20 - (_scrollPosition / (windowHeight * 0.1 / 20));
    if (_scroller < 0) _scroller = 0;
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controllerSearch.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:
            (theme.darkMode) ? theme.blackColorTitleBkg : theme.colorBackground,
        body: Directionality(
          textDirection: strings.direction,
          child: Stack(children: [
            NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      expandedHeight: windowHeight * 0.2,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: ClipPath(
                        clipper:
                            ClipPathClass23((_scroller < 5) ? 5 : _scroller),
                        child: Container(
                            color: Colors.orange,
                            child: Stack(
                              children: [
                                FlexibleSpaceBar(
                                    collapseMode: CollapseMode.pin,
                                    titlePadding: EdgeInsets.only(
                                        bottom: 10, left: 20, right: 20),
                                    title: _titleSmall())
                              ],
                            )),
                      ))
                ];
              },
              body: Container(
                width: windowWidth,
                height: windowHeight,
                child: _body(),
              ),
            ),
            appbar1(
                Colors.transparent,
                (theme.darkMode) ? Colors.white : Colors.black,
                "",
                context, () {
              goBack();
            })
          ]),
        ));
  }

  _titleSmall() {
    return Container(
        alignment: Alignment.bottomLeft,

        padding:
            EdgeInsets.only(bottom: _scroller, left: 20, right: 20, top: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Categories",
              style: theme.style16W800,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  _body() {
    List<Widget> list = [];


    for (var e in categories.take(16)) {
      if (e.parent.isNotEmpty) continue;
      list.add(
        newCategoryBtn(
            getTextByLocale(e.name, strings.locale), e.color, e.serverPath, () {
          _mainModel.categoryData = e;
          route("category");
        }, windowWidth / 1 - 20, windowWidth * 0.12,
            direction: strings.direction),


      );
    }

    list.add(SizedBox(
      height: 150,
    ));
    return Container(
        child: ListView(padding: EdgeInsets.only(top: 0), children: <Widget>[
      Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: list,
          )),
    ]));
  }


}
