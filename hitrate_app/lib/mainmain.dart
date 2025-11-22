import 'package:flutter/material.dart';
import 'package:hitrate_app/pages/boxbreak.dart';
import 'package:hitrate_app/pages/hitrates.dart';
import 'package:hitrate_app/pages/que.dart';

class Mainmain extends StatefulWidget {
  const Mainmain({super.key});

  @override
  State<Mainmain> createState() => _MainmainState();
}

class _MainmainState extends State<Mainmain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.25,
                child: Image.asset(
                  'assets/finalbanner.png',
                  fit: BoxFit.cover,
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'Hit Rates'),
                  Tab(text: 'Box Break'),
                  Tab(text: 'Que'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Hitrates(),
                    Boxbreak(),
                    Que(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
