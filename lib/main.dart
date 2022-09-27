import 'package:flutter/material.dart';
import 'package:mailapp/dashboard.dart';
import 'package:mailapp/finger.dart';
import 'package:mailapp/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class GmailHome extends StatefulWidget {
  GmailHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GmailHomeState createState() => _GmailHomeState();
}

class _GmailHomeState extends State<GmailHome> {
  int selectedIndex = 0;

  PageController controller = PageController();

  List<GButton> tabs = [];

  final List<Widget> _children = const [
    Dashboard(title: 'dashboard'),
    Finger(),
  ];

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    double gap = 30;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.blue,
      textColor: Colors.blue,
      backgroundColor: Colors.blue[50],
      iconSize: 24,
      padding: padding,
      icon: Icons.inbox,
      // textStyle: t.textStyle,
      text: 'Mail',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.blue,
      textColor: Colors.blue,
      backgroundColor: Colors.blue[50],
      iconSize: 24,
      padding: padding,
      icon: Icons.search,
      // textStyle: t.textStyle,
      text: 'Finger',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(
              child: _children[position],
            );
          },
          itemCount: tabs.length, // Can be null
        ),
        // backgroundColor: Colors.green,
        // body: Container(color: Colors.red,),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.20),
                  offset: Offset(0, 15))
            ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: GNav(
                  tabs: tabs,
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
