import 'package:flutter/material.dart';
import 'package:inews/animatedicon/animatedicos.dart';
import 'package:inews/pages/front.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

class calendar extends StatelessWidget {
  const calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 300,
      width: double.infinity,
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
        onDateChanged: (value) {},
      ),
    );
  }
}

class notification extends StatelessWidget {
  const notification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class icons_call_name extends StatelessWidget {
  const icons_call_name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              animatedIcons("breakingnews", "breakingnews"),
              animatedIcons("politics", "politics"),
              animatedIcons("business", "business"),
              animatedIcons("technology", "technology"),
              animatedIcons("entertaimnet", "entertainment"),
              animatedIcons("sports", "sports"),
            ],
          )),
    );
  }
}

class country_name extends StatelessWidget {
  const country_name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 65,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white.withOpacity(0.5),
            image: DecorationImage(
              image: AssetImage("assets/BHARAT.png"),
            ),
          ),
        ),
        Text(
          "BHARAT",
          style: TextStyle(fontSize: 30, fontFamily: "BungeeRegular"),
        ),
      ],
    );
  }
}

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassListTile(
      leading: GlassIcon(Icons.search),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          hintStyle: glassTextStyle,
        ),
        style: glassTextStyle,
        onSubmitted: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => landingpage(
                  "https://newsapi.org/v2/everything?q=$value&apiKey=f38d918f6c2c43db854407a3ef3487d4"),
            ),
          );
        },
      ),
    );
  }
}

class heading_design_news extends StatelessWidget {
  const heading_design_news({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'i',
              style: TextStyle(fontSize: 43.0, fontFamily: "BungeeRegular"),
            ),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.indigoAccent,
              fontSize: 40.0,
              fontFamily: 'BungeeRegular',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('NEWS',
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255))),
                RotateAnimatedText('SPORTS',
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 246, 246, 246))),
                RotateAnimatedText('TECH',
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 86, 10, 215))),
                RotateAnimatedText('Politics',
                    textStyle:
                        TextStyle(color: Color.fromARGB(255, 250, 250, 250))),
                RotateAnimatedText('FASHION',
                    textStyle:
                        TextStyle(color: Color.fromARGB(255, 253, 253, 251))),
              ],
              repeatForever: true,
            ),
          ),
        ],
      ),
    );
  }
}
