import 'package:workspacify_flutter_test/utils/constants.dart';

import '../models/text_icon.dart';

final List<TextIcon> typesList = [
  TextIcon(text: "All"),
  TextIcon(
      text: "Single Live",
      icon: "${AppConstants.APP_IMAGE_ASSET}/single_live.svg"
  ),
  TextIcon(
      text: "Audio",
      icon: "${AppConstants.APP_IMAGE_ASSET}/audio.svg"
  ),
  TextIcon(
      text: "Multi-guest Live",
      icon: "${AppConstants.APP_IMAGE_ASSET}/multi_guest_live.svg"
  ),
];