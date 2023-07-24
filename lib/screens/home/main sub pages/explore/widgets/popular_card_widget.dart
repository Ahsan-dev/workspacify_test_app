import 'package:flutter/material.dart';
import 'package:workspacify_flutter_test/data/models/popular.dart';
import 'package:workspacify_flutter_test/utils/dimensions.dart';

class PopularCardWidget extends StatefulWidget {
  const PopularCardWidget({Key? key, this.popular}) : super(key: key);
  final Popular? popular;

  @override
  State<PopularCardWidget> createState() => _PopularCardWidgetState();
}

class _PopularCardWidgetState extends State<PopularCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)
          )
      ),
      child: Container(
        height: 150,
        child: Stack(
          children: [
            Image.asset(
              "${widget.popular?.image}",
              fit: BoxFit.fill,
              height: 150,
            ),
            Positioned(
              bottom: 8,
              left: 5,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "${widget.popular?.title}",
                      style: TextStyle(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: Colors.white
                      ),
                  ),
                  SizedBox(
                    height: 10,
                    child: Row(
                        children: [
                          Image.asset(
                            "${widget.popular?.countryRegion.flag}",
                            height: 15,
                            width: 15,
                          ),
                          Text(
                            "${widget.popular?.countryRegion.name}",
                            style: TextStyle(
                                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                              color: Colors.white
                            ),
                          )
                        ]
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
