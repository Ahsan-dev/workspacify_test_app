import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
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
