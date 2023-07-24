import 'package:flutter/material.dart';
import 'package:workspacify_flutter_test/data/models/country_region.dart';
import 'package:workspacify_flutter_test/utils/constants.dart';

class CountryRegionWidget extends StatefulWidget {
  const CountryRegionWidget({Key? key, this.countryRegion}) : super(key: key);
  final CountryRegion? countryRegion;

  @override
  State<CountryRegionWidget> createState() => _CountryRegionWidgetState();
}

class _CountryRegionWidgetState extends State<CountryRegionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
              "${widget.countryRegion?.flag}",
              height: 50,
          ),
          SizedBox(height: 5,),
          Text("${widget.countryRegion?.name}")
        ],
      ),
    );
  }
}
