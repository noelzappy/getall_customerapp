import 'dart:async';
import 'dart:math';
import 'package:abg_utils/abg_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';
import 'strings.dart';
import 'lang.dart';
import 'theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double windowWidth = 0;
  double windowHeight = 0;
  double windowSize = 0;
  late MainModel _mainModel;

  _startNextScreen() {
    if (_loaded) {
      if (!_startLoaded) {
        _startLoaded = true;
        Navigator.pop(context);
        if (localSettings.locale.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LanguageScreen(openFromSplash: true),
            ),
          );
        } else
          Navigator.pushNamed(context, "/ondemandservice_main");
      }
    }
  }

  @override
  void initState() {
    _mainModel = Provider.of<MainModel>(context, listen: false);
    super.initState();
    _load();
    startTime();
  }

  bool _loaded = false;
  bool _startLoaded = false;

  _load() async {
    var ret = await _mainModel.init(context);
    if (ret != null) {
      messageError(context, ret);
      _loaded = true;
      return startTime();
    }
    dprint("SplashScreen");
    _loaded = true;
    _startNextScreen();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, _startNextScreen);
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    windowSize = min(windowWidth, windowHeight);
    dprint(
        "splash theme.logoAsset=${theme.logoAsset} theme.logo=${theme.logo}");
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFDC208), Color(0xFFE62D3D)])),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: windowWidth * 0.9,
                  height: windowWidth * 0.9,
                  child: Image.asset("assets/splash-logo.png",
                      fit: BoxFit.contain)),
            ],
          ),
        ),
      ],
    ));
  }
}
