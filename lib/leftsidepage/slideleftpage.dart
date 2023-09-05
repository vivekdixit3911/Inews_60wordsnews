import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:inews/pages/front.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class full_content extends StatelessWidget {
  var imagea;
  var headline;
  var cont;
  Uri url2;
  full_content({
    super.key,
    required this.imagea,
    required this.headline,
    required this.cont,
    required this.url2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 220.9,
            child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: Colors.accents)),
              child: CachedNetworkImage(
                imageUrl: imagea ??
                    "https://images.pexels.com/photos/208805/pexels-photo-208805.jpeg",
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GlassContainer(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "$headline",
                style: TextStyle(
                    color: Color.fromARGB(255, 6, 6, 6),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "$cont",
              style: TextStyle(
                  color: Colorss, fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 20,
                width: 200,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlassButton(
                onPressed: () {
                  launchUrl(url2,
                      webViewConfiguration:
                          WebViewConfiguration(enableDomStorage: true));
                },
                child: Row(
                  children: [
                    Text(
                      "  Click to kow full news!!!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            GlassContainer(
              height: 80,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "We'll be Displaying adds here in future",
                  style: TextStyle(fontSize: 16, fontFamily: "BungeeRegular"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
