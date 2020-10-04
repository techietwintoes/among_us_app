import 'dart:math' as math;
import 'dart:ui';

import 'package:among_us_app/generateButton.dart';
import 'package:among_us_app/starPainter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:among_us_app/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget stars;

  @override
  void initState() {
    stars = Stars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,
        leading: PopupMenuButton<int>(
          icon: Image.asset(
            "assets/images/info_btn.png",
            fit: BoxFit.contain,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.settings_backup_restore),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Reset"),
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Exit"),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            width: kToolbarHeight,
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/share_btn.png",
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Share.share(
                    "Hey, See what I created on the Among Us Avatar App.");
              },
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        minHeight: 125,
        maxHeight: 400,
        parallaxEnabled: true,
        parallaxOffset: 0.8,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        collapsed: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                border: Border.all(color: Colors.white, width: 4),
                color: Colors.black,
              ),
              margin: EdgeInsets.all(0),
              child: SizedBox.expand(),
            ),
            Positioned(
                child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width - 8,
              height: 6,
            ))
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Stack(
              children: [
                stars,
              ],
            ),
            Image.asset(
              "assets/images/BG/BG${Provider.of<globals.RVProvider>(context).bgVariable}-01.png",
              height: 200,
            ),
            Image.asset(
              "assets/images/CH/CH${Provider.of<globals.RVProvider>(context).colorVariable}-01.png",
              height: 200,
            )
          ],
        ),
        panel: GenerateBottomPanel(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GenerateButton(),
    );
  }
}

class GenerateBottomPanel extends StatelessWidget {
  const GenerateBottomPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        border: Border.all(color: Colors.white, width: 4),
        color: Colors.black,
      ),
      child: SizedBox.expand(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftBGVariable(false);
                    }),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "BG${Provider.of<globals.RVProvider>(context).bgVariable}-01.png",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftBGVariable(true);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftColorVariable(false);
                    }),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "CH${Provider.of<globals.RVProvider>(context).colorVariable}-01.png",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<globals.RVProvider>(context, listen: false)
                          .shiftColorVariable(true);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(particles: 30),
      child: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
