import 'package:workspacify_flutter_test/utils/constants.dart';

import '../models/event.dart';

final List<Event> eventsList = [
  Event(
      name: "Cultural Mingle",
      image: "${AppConstants.APP_IMAGE_ASSET}/event1.jpg",
      time: "June 17, 10:31 AM",
      isBooked: true
  ),
  Event(
      name: "Global Fusion",
      image: "${AppConstants.APP_IMAGE_ASSET}/event2.jpg",
      time: "Aug 24, 7:31 PM",
      isBooked: false
  ),
  Event(
      name: "Event X",
      image: "${AppConstants.APP_IMAGE_ASSET}/event3.jpg",
      time: "Aug 24, 7:31 PM",
      isBooked: false
  ),
  Event(
      name: "Event Y",
      image: "${AppConstants.APP_IMAGE_ASSET}/event4.jpg",
      time: "Aug 24, 7:31 PM",
      isBooked: true
  ),
];