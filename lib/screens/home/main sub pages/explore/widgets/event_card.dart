import 'package:flutter/material.dart';
import 'package:workspacify_flutter_test/my_theme.dart';
import 'package:workspacify_flutter_test/utils/dimensions.dart';

import '../../../../../data/models/event.dart';

class EventCardWidget extends StatefulWidget {
  const EventCardWidget({Key? key, this.event}) : super(key: key);
  final Event? event;

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 3,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "${widget.event?.image}",
                  height: 90,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 5,
                  left: 2,
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "${widget.event?.time}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.FONT_SIZE_SMALL
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "${widget.event?.name}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: TextButton(
                onPressed: (){

                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.event?.isBooked==true ? MyTheme.box_gray : MyTheme.back_blue,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                      color: widget.event?.isBooked==true ? MyTheme.box_gray : MyTheme.main_blue
                    )
                  ),
                  child: Center(
                    child: Text(
                      widget.event?.isBooked==true? "Booked":"Book",
                      style: TextStyle(
                        color: widget.event?.isBooked==true? MyTheme.font_gray : MyTheme.main_blue
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
