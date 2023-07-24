import 'package:flutter/material.dart';
import 'package:workspacify_flutter_test/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "${AppConstants.APP_IMAGE_ASSET}/under_construction.jpg"
        ),
      ),
    );
  }
}
