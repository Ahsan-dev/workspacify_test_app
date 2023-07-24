import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspacify_flutter_test/routes/app_routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSplash();
  }

  Future<void> _initSplash() async {
    await Future.delayed(Duration(seconds: 3));
    Provider.of<FluroRouter>(context, listen: false)
        .navigateTo(context, AppRouters.APP_MAIN_ROUTE, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child:Center(
              child: Image.asset("assets/images/workspacify_logo.jpg"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                  "Test Application ® Workspacify",
                  style: TextStyle(
                    fontSize: 17,
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
