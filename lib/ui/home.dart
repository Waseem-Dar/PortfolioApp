import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/main.dart';
import 'package:flutter_web_portfolio/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about.dart';
import 'contact_us.dart';
import 'footer.dart';
import 'header.dart';
import 'icon.dart';
import 'my_projects.dart';
import 'statistics.dart';
import 'working_process.dart';
import '../config/colors.dart';
import '../config/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobalKey = GlobalKey();
  final _statisticsGlobalKey = GlobalKey();
  final _workingProcessGlobalKye = GlobalKey();
  final _recentProjectsGlobalKey = GlobalKey();
  final _contactUsGlobalKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();
  bool _isHovered = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveWidget(

      desktopScreen: Scaffold(
        body:Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('images/cover_bg_2.jpg'),
            fit: BoxFit.cover,alignment: Alignment.center,
            ),
            ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  // width: screenWidth>=1400?1400:null,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/header_bg.jpg'),
                      fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.black54,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .15,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: AppColors.yellow,
                      child: Image.asset('images/ouahid.png'),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Header(),
                ),
                actions: [
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: _scrollToAbout,
                        highlightColor: Colors.white60,hoverColor: Colors.black26,
                        child: Text(
                          'About Me',
                          style: GoogleFonts.chakraPetch(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToStatistics,
                        highlightColor: Colors.white60,hoverColor: Colors.black26,
                        child: Text(
                          'Experience',
                          style: GoogleFonts.chakraPetch(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToWorkingProcess,
                        highlightColor: Colors.white60,hoverColor: Colors.black26,
                        child: Text(
                          'Process',
                          style: GoogleFonts.chakraPetch(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToRecentProjects,
                        highlightColor: Colors.white60,hoverColor: Colors.black26,
                        child: Text(
                          'Portfolio',
                          style: GoogleFonts.chakraPetch(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: _scrollToContactUs,
                        style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                          backgroundColor: AppColors.yellow,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 0,
                          ),
                        ),

                        child: Text(
                          'Contact Me',
                          style: GoogleFonts.chakraPetch(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .15),
                ],
              ),

              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
      tabletScreen: Scaffold(
        drawer: Drawer(
          surfaceTintColor: Color(0xFFECF0F3),
          backgroundColor: Color(0xFFECF0F3),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'images/ouahid.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Divider(height: 0.3,
                ),
                ListTile(
                  onTap: _scrollToAbout,
                  title: Text(
                    'About Me',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToStatistics,
                  title: Text(
                    'Experience',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToWorkingProcess,
                  title: Text(
                    'Process',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToRecentProjects,
                  title: Text(
                    'Portfolio',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                ListTile(
                  title: ElevatedButton(
                    onPressed: _scrollToContactUs,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),

                    child: Text(
                      'Contact Me',
                      style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text("OR"),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        // launch(AppConstants.github);
                      },
                      child: AppIcon(
                        'icons/github.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // launch(AppConstants.linkedin);
                      },
                      child: AppIcon(
                        'icons/linkedin.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // launch(AppConstants.twitter);
                      },
                      child: AppIcon(
                        'icons/twitter.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // launch(AppConstants.facebook);
                      },
                      child: AppIcon(
                        'icons/facebook.png',
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/cover_bg_2.jpg'),
                fit: BoxFit.cover,alignment: Alignment.center
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Align(
                  child: Builder(
                    builder: (ctx) => InkWell(
                      onTap: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: AppColors.yellow,
                          child: Image.asset('images/ouahid.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/header_bg.jpg'),
                        fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.black54,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(350),
                  child: Header(),
                ),
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
      mobileScreen: Scaffold(
        drawer: Drawer(
          surfaceTintColor:Color(0xFFECF0F3),
          backgroundColor: Color(0xFFECF0F3),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'images/ouahid.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Divider(height: 0.5,
                ),
                ListTile(
                  onTap: _scrollToAbout,
                  title: Text(
                    'About Me',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToStatistics,
                  title: Text(
                    'Experience',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToWorkingProcess,
                  title: Text(
                    'Process',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToRecentProjects,
                  title: Text(
                    'Portfolio',
                    style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                ListTile(
                  title: ElevatedButton(
                    onPressed: _scrollToContactUs,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),

                    child: Text(
                      'Contact Me',
                      style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text("OR"),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        // launch(AppConstants.github);
                      },
                      child: AppIcon(
                        'icons/github.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // launch(AppConstants.linkedin);
                      },
                      child: AppIcon(
                        'icons/linkedin.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // launch(AppConstants.twitter);
                      },
                      child: AppIcon(
                        'icons/twitter.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // launch(AppConstants.facebook);
                      },
                      child: AppIcon(
                        'icons/facebook.png',
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/cover_bg_2.jpg'),
              fit: BoxFit.cover,alignment: Alignment.center
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Align(
                  child: Builder(
                    builder: (ctx) => InkWell(
                      onTap: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: AppColors.yellow,
                          child: Image.asset('images/ouahid.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/header_bg.jpg'),
                      fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.black54,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(350),
                  child: Header(),
                ),
              ),

              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
    );
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _aboutGlobalKey,
          child: About(),
        ),
        SliverToBoxAdapter(
          key: _statisticsGlobalKey,
          child: Statistics(),
        ),
        SliverToBoxAdapter(
          key: _workingProcessGlobalKye,
          child: WorkingProcess(),
        ),
        SliverToBoxAdapter(
          key: _recentProjectsGlobalKey,
          child: MyProjects(),
        ),
        SliverToBoxAdapter(
          key: _contactUsGlobalKey,
          child: ContactUs(),
        ),
        SliverToBoxAdapter(
          child: Footer(),
        ),
      ];

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: InkWell(
              onTap: showFab ? _scrollToHeader : null,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
              height: 50,
              width: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: _isHovered ? AppColors.yellow : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 8)]
                ),
                // elevation: 0,
                child: Icon(Icons.arrow_upward, size: 25,
                  color: _isHovered ? Colors.white : AppColors.yellow!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToStatistics() {
    Scrollable.ensureVisible(
      _statisticsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToWorkingProcess() {
    Scrollable.ensureVisible(
      _workingProcessGlobalKye.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToRecentProjects() {
    Scrollable.ensureVisible(
      _recentProjectsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
