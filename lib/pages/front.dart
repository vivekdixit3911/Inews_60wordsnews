import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:inews/apis/apicalling.dart';
import 'package:inews/leftsidepage/slideleftpage.dart';
import 'package:lottie/lottie.dart';

var Colorss = Color.fromARGB(255, 0, 0, 0);

class landingpage extends StatefulWidget {
  final String links;
  const landingpage(this.links);

  @override
  State<landingpage> createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  late final PageController _controller = PageController();
  var headline;
  var cont;
  var imagea;
  var url;
  var data;
  late int number = 1;

  void ca(String Links) async {
    data = await callinApi(Links);
    callingapis();
  }

  bool hasInternet = true;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();

    String lik = widget.links;
    ca(lik);
  }

  void _checkInternetConnection() {
    Connectivity().onConnectivityChanged.listen((connectivityResult) {
      setState(() {
        hasInternet = connectivityResult != ConnectivityResult.none;
      });
    });
  }

  final List<Widget> pages = [];
  int currentPage = 0;

  Future callingapis() async {
    try {
      for (int i = 0; i < 19; i++) {
        headline = await data["articles"][i]["title"];
        imagea = await data["articles"][i]["urlToImage"];
        cont = await data["articles"][i]["content"];
        url = await data["articles"][i]["url"];
        var url2 = Uri.parse("$url");
        pages.add(full_content(
            imagea: imagea,
            headline: headline,
            cont: cont,
            url2: url2) as Widget);
      }

      setState(() {});
    } on Exception catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.cyanAccent,
                  Colors.white10,
                  Colors.pink.shade200,
                  Colors.lightBlueAccent,
                  Colors.purple
                ],
              ),
            )),
            Container(
              child: pages.isEmpty
                  ? Lottie.asset("assets/lottie/loading.json")
                  : PageView(
                      scrollDirection: Axis.vertical,
                      controller: _controller,
                      children: pages,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
