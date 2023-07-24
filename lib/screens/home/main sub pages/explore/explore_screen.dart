import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workspacify_flutter_test/data/dummy_data/area_list.dart';
import 'package:workspacify_flutter_test/data/dummy_data/countries_regions.dart';
import 'package:workspacify_flutter_test/data/dummy_data/events_list.dart';
import 'package:workspacify_flutter_test/data/dummy_data/genderList.dart';
import 'package:workspacify_flutter_test/data/dummy_data/popular_list.dart';
import 'package:workspacify_flutter_test/data/dummy_data/type_list.dart';
import 'package:workspacify_flutter_test/data/models/country_region.dart';
import 'package:workspacify_flutter_test/data/models/text_icon.dart';
import 'package:workspacify_flutter_test/my_theme.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/explore/widgets/country_and_region.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/explore/widgets/event_card.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/explore/widgets/popular_card_widget.dart';
import 'package:workspacify_flutter_test/screens/home/main%20sub%20pages/explore/widgets/text_image.dart';
import 'package:workspacify_flutter_test/utils/dimensions.dart';

import '../../../../utils/constants.dart';
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ScrollController _scrollController = ScrollController();
  final PageController _pageViewController = PageController(initialPage: 0);
  int _activePage = 0;

  TextIcon _selectedGender = genderList[0];
  TextIcon _selectedType = typesList[0];
  TextIcon _selectedArea = areasList[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          //Countries And Regions Portion
          SliverList(
              delegate: SliverChildListDelegate([
                _buildCountryRegionPortion(context)
              ])
          ),
          
          //Event Portion
          SliverList(
              delegate: SliverChildListDelegate([
                _buildEventsPortion(context)
              ])
          ),
          
          //Popular Portion
          SliverList(
              delegate: SliverChildListDelegate([
                _buildPopularPortion(context)
              ])
          )
        ],
      ),
    );
  }

  _buildCountryRegionPortion(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              Dimensions.PADDING_SIZE_SMALL,
              0,
              Dimensions.PADDING_SIZE_SMALL,
              0
          ),
          child: _buildCountryRegionHead(context),
        ),
        _buildCountryRegionBody(context)
      ],
    );
  }

  Row _buildCountryRegionHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Countries & Regions",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w600,
            color: MyTheme.tool_deep_blue
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "See all",
              style: TextStyle(
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  color: MyTheme.tool_deep_blue),
            ))
      ],
    );
  }

  _buildCountryRegionBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          color: Colors.white,
          height: 230,
          child: PageView.builder(
              controller: _pageViewController,
              onPageChanged: (int index) {
                setState(() {
                  _activePage = index;
                });
              },
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return _buildCountryRegionsGrid(context, _activePage);
              }),
        ),
        Positioned(
          bottom: 25,
          left: 0,
          right: 0,
          height: 10,
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  2,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: InkWell(
                          onTap: () {
                            _pageViewController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: index == _activePage
                              ? Container(
                                  height: 10,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: MyTheme.main_blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                )
                              : CircleAvatar(
                                  radius: 5, backgroundColor: MyTheme.box_gray),
                        ),
                      )),
            ),
          ),
        )
      ],
    );
  }

  _buildCountryRegionsGrid(BuildContext context, index) {
    List<CountryRegion> _list = [];
    if (index == 0) {
      _list = countryRegionsList.sublist(0, 8);
    } else {
      _list = countryRegionsList.sublist(8, 16);
    }

    return SingleChildScrollView(
      child: GridView.builder(
        itemCount: _list.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 2.50 / 2.7),
        // padding: EdgeInsets.all(8),
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: CountryRegionWidget(
                countryRegion: _list[index],
              ));
        },
      ),
    );
  }

  _buildEventsPortion(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              Dimensions.PADDING_SIZE_SMALL,
              0,
              Dimensions.PADDING_SIZE_SMALL,
              0
          ),
          child: _buildEventsHead(context),
        ),
        _buildEventsBody(context)
      ],
    );
  }

  Row _buildEventsHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Event",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w600,
              color: MyTheme.tool_deep_blue
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "See all",
              style: TextStyle(
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  color: MyTheme.tool_deep_blue
              ),
            ))
      ],
    );
  }

  _buildEventsBody(BuildContext context){
      return SizedBox(
        height: 195,
        child: GridView.builder(
          itemCount: eventsList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 0,
              childAspectRatio: 4.30 / 3.56),
          // padding: EdgeInsets.all(8),
          // physics: NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                child: EventCardWidget(
                  event: eventsList[index],
                )
            );
          },
        ),
      );
  }

  _buildPopularPortion(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              Dimensions.PADDING_SIZE_SMALL,
              0,
              Dimensions.PADDING_SIZE_SMALL,
              0
          ),
          child: _buildPopularHead(context),
        ),
        _buildPopularBody(context)
      ],
    );
  }

  Row _buildPopularHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Popular",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w600,
              color: MyTheme.tool_deep_blue
          ),
        ),
        IconButton(
            onPressed: () {
              _buildBottomSheetFilter(context);
            },
            icon: SvgPicture.asset(
              "${AppConstants.APP_IMAGE_ASSET}/filter.svg"
            )
        )
      ],
    );
  }

  _buildPopularBody(BuildContext context){
    return SizedBox(
      height:300,
      child: GridView.builder(
        itemCount: popularList.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 0,
            childAspectRatio: 1 / 1),
        // padding: EdgeInsets.all(8),
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
              child: PopularCardWidget(
                popular: popularList[index],
              )
          );
        },
      ),
    );
  }

  _buildBottomSheetFilter(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
            )
        ),
        context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: Dimensions.PADDING_SIZE_DEFAULT,
                    left: Dimensions.PADDING_SIZE_DEFAULT,
                    right: Dimensions.PADDING_SIZE_DEFAULT,
                    bottom: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  height: MediaQuery.of(context).size.height/3*2,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          _buildRoomFilterHead(context),
                          SizedBox(height: 15,),
                          _buildGenderFilter(context, setState),
                          SizedBox(height: 15,),
                          _buildTypeFilter(context, setState),
                          SizedBox(height: 15,),
                          _buildAreaFilter(context, setState)
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: (){
                          },
                          child: Container(
                            height: 40, width: double.infinity,
                            decoration: BoxDecoration(
                                color: MyTheme.main_blue,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child: Center(
                                child: Text(
                                    'Apply',
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  _buildRoomFilterHead(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Room Filter",
          style: TextStyle(
            fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
            fontWeight: FontWeight.w600,
            color: MyTheme.tool_deep_blue
          ),
        ),
        SizedBox(height: 5,),
        Text(
          "You can search applying the following filters",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w600,
              color: MyTheme.font_gray
          ),
        ),
        SizedBox(height: 10,),
        Divider(
          color: MyTheme.white_gray,
          thickness: 2,
        )
      ],
    );
  }

  _buildGenderFilter(BuildContext context, setState){

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              fontWeight: FontWeight.w600,
              color: MyTheme.tool_deep_blue
          ),
        ),
        SizedBox(height: 10,),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children:
           genderList.map((item) => InkWell(
             onTap: (){
               _selectedGender = item;
               setState(() {});
             },
             child: TextImage(
               textIcon: item,
               isSelected: item==_selectedGender?true:false,
             ),
           )).toList(),
        )
      ],
    );
  }

  _buildTypeFilter(BuildContext context, setState){

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Room Type",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              fontWeight: FontWeight.w600,
              color: MyTheme.tool_deep_blue
          ),
        ),
        SizedBox(height: 10,),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
          typesList.map((item) => InkWell(
            onTap: (){
              _selectedType = item;
              setState(() {});
            },
            child: TextImage(
              textIcon: item,
              isSelected: item==_selectedType?true:false,
            ),
          )).toList(),
        )
      ],
    );
  }

  _buildAreaFilter(BuildContext context, setState){

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Area",
          style: TextStyle(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              fontWeight: FontWeight.w600,
              color: MyTheme.tool_deep_blue
          ),
        ),
        SizedBox(height: 10,),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
          areasList.map((item) => InkWell(
            onTap: (){
              _selectedArea = item;
              setState(() {});
            },
            child: TextImage(
              textIcon: item,
              isSelected: item==_selectedArea?true:false,
            ),
          )).toList(),
        )
      ],
    );
  }

}
