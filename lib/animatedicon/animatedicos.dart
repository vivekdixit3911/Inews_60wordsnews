import 'package:flutter/material.dart';
import 'package:inews/pages/front.dart';
import 'package:lottie/lottie.dart';

class animatedIcons extends StatelessWidget {
  final String first;
  final String link;
  const animatedIcons(this.first, this.link);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          child: GestureDetector(
            onTap: () {
              String ll;
              if (link == "breakingnews") {
                ll = "https://newsapi.org/v2/top-headlines?country=in";
              } else {
                ll =
                    "https://newsapi.org/v2/top-headlines?country=in&category=$link";
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => landingpage(ll),
                ),
              );
            },
            child: Lottie.asset("assets/lottie/$first.json"),
          ),
        ),
        Text(
          "$first",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        // Container(he),
      ],
    );
  }
}
