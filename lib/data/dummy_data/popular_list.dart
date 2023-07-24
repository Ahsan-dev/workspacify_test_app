import 'package:workspacify_flutter_test/data/dummy_data/countries_regions.dart';
import 'package:workspacify_flutter_test/data/models/country_region.dart';
import 'package:workspacify_flutter_test/utils/constants.dart';

import '../models/popular.dart';

final List<Popular> popularList = [
  Popular(
      title: "Harmony In Motion",
      image: "${AppConstants.APP_IMAGE_ASSET}/popular1.jpg",
      countryRegion: CountryRegion(
          name: countryRegionsList[0].name,
          flag: countryRegionsList[0].flag
      )
  ),
  Popular(
      title: "Enjoyment",
      image: "${AppConstants.APP_IMAGE_ASSET}/popular2.jpg",
      countryRegion: CountryRegion(
          name: countryRegionsList[0].name,
          flag: countryRegionsList[0].flag
      )
  ),
  Popular(
      title: "Celebrations",
      image: "${AppConstants.APP_IMAGE_ASSET}/popular1.jpg",
      countryRegion: CountryRegion(
          name: countryRegionsList[0].name,
          flag: countryRegionsList[0].flag
      )
  ),
  Popular(
      title: "Joyous Jumboree",
      image: "${AppConstants.APP_IMAGE_ASSET}/popular3.jpg",
      countryRegion: CountryRegion(
          name: countryRegionsList[0].name,
          flag: countryRegionsList[0].flag
      )
  ),
  Popular(
      title: "Friends Circle",
      image: "${AppConstants.APP_IMAGE_ASSET}/popular1.jpg",
      countryRegion: CountryRegion(
          name: countryRegionsList[0].name,
          flag: countryRegionsList[0].flag
      )
  ),
  Popular(
      title: "Fest Friends",
      image: "${AppConstants.APP_IMAGE_ASSET}/popular2.jpg",
      countryRegion: CountryRegion(
          name: countryRegionsList[0].name,
          flag: countryRegionsList[0].flag
      )
  ),


];