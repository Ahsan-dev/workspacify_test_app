import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/community_screen.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/explore/explore_screen.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/home_screen.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/profile_screen.dart';

import '../../my_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final tabs = [
    HomeScreen(),
    ExploreScreen(),
    HomeScreen(),
    CommunityScreen(),
    ProfileScreen()
  ];

  final tabs_title = [
    "Home",
    "Explore",
    "",
    "Community",
    "Me"
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return await showDialog<bool>(
            context: context,
            builder: (context) {
              return _buildOnWillPop(context);
            }) ??
            false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(context),
        body: tabs[_currentIndex],
        bottomNavigationBar: _buildBottomAppBar(context),
        floatingActionButton: _buildVideoFloating(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  AlertDialog _buildOnWillPop(BuildContext context){
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text(
          'You wanna exit!!.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Exit', style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Stay', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){

        },
        child: Builder(
          builder: (context)=>Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 0.0),
            child: Container(
                child: SvgPicture.asset("assets/images/tool_back.svg")
            ),
          ),
        ),
      ),
      titleSpacing: 0,
      title: Text(
          _currentIndex==2?"":tabs_title[_currentIndex],
        style: TextStyle(
          fontSize: 25,
          color: MyTheme.tool_deep_blue,
          fontWeight: FontWeight.bold
        ),
      ),
      actions: [
          _buildNotficationAction(context)
      ],
    );
  }

  IconButton _buildNotficationAction(BuildContext context){
    return IconButton(
        onPressed: (){},
        icon: SvgPicture.asset("assets/images/notification.svg")
    );
  }


  BottomNavigationBar _buildBottomAppBar(BuildContext context){
    return BottomNavigationBar(
      unselectedFontSize: 11,
        onTap: (index){
          if(index==2){
            // _showCreateTripModal(context);
          }else{
            setState(() {
              _currentIndex = index;
            });
          }

        },
        currentIndex: _currentIndex,
        selectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        fixedColor: MyTheme.main_blue,
        items: [
          _buildHomeItem(context),
          _buildExploreItem(context),
          BottomNavigationBarItem(
              icon: Container(),
            label: ""
          ),
          _buildCommunityItem(context),
          _buildMeItem(context)
        ]
    );
  }

  BottomNavigationBarItem _buildHomeItem(BuildContext context){
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: SvgPicture.asset(
            _currentIndex == 0?
                "assets/images/home_selected.svg" : "assets/images/home_not_selected.svg",
            height: 20,
          ),
        ),
        label: "Home"
    );
  }

  BottomNavigationBarItem _buildExploreItem(BuildContext context){
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: SvgPicture.asset(
            _currentIndex == 1?
              "assets/images/compass_selected.svg" : "assets/images/compass_not_selected.svg",
            height: 20,
          ),
        ),
        label: "Explore"
    );
  }

  BottomNavigationBarItem _buildCommunityItem(BuildContext context){
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: SvgPicture.asset(
              _currentIndex == 3?
              "assets/images/community_selected.svg" : "assets/images/community_not_selected.svg",
            height: 20,
          ),
        ),
        label: "Community"
    );
  }

  BottomNavigationBarItem _buildMeItem(BuildContext context){
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: SvgPicture.asset(
              _currentIndex == 4?
              "assets/images/profile_selected.svg" : "assets/images/profile_not_selected.svg",
            height: 20,
          ),
        ),
        label: "Me"
    );
  }

  FloatingActionButton _buildVideoFloating(BuildContext context){
    return  FloatingActionButton(
        backgroundColor: MyTheme.main_blue,
        onPressed: (){},
        tooltip: "Videos",
        child:
        Container(
          width: 60,
          height: 60,
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/images/video-recorder.svg",
                  //height: 80,
                ),
              ),
            ],
          ),
        )
      // AnimatedIcon(
      //   icon: AnimatedIcons.menu_close,
      //   progress: _animateIcon,
      // ),

    );
  }

}
