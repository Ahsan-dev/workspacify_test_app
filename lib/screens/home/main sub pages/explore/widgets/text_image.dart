import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workspacify_flutter_test/data/models/text_icon.dart';

import '../../../../../my_theme.dart';

class TextImage extends StatefulWidget {
  const TextImage({
    Key? key,
    required this.textIcon, required this.isSelected
  }) : super(key: key);
  final TextIcon textIcon;
  // final Color color;
  final bool isSelected;

  @override
  State<TextImage> createState() => _TextImageState();
}

class _TextImageState extends State<TextImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color:widget.isSelected?MyTheme.back_blue:MyTheme.white_gray,
          borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.textIcon.icon!=null?
          SvgPicture.asset(
            "${widget.textIcon.icon}"
          ):Container(),
          SizedBox(width:widget.textIcon.icon!=null?5:0),
          Text(
              widget.textIcon.text,
              style: TextStyle(
                color: widget.isSelected?MyTheme.main_blue:MyTheme.font_gray
              ),
          )
        ],
      ),
    );

  }
}
