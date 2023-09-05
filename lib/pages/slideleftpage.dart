import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inews/frontpagewidgets/frontpagewidgets.dart';

class slideright extends StatefulWidget {
  const slideright({super.key});

  @override
  State<slideright> createState() => _sliderightState();
}

class _sliderightState extends State<slideright> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 131, 197, 219),
        body: SafeArea(
          child: rightpagedeignhandle(context),
        ));
  }

  ListView rightpagedeignhandle(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 90),
          child: heading_design_news(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: searchbar(),
        ),
        country_name(),
        icons_call_name(),
        notification(),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: calendar(),
        ),
      ],
    );
  }
}
