// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:finalproject/constants.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget body;
  final int? numOfMails;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.body,
    this.numOfMails,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              widget.title,
              const Spacer(),
              widget.numOfMails == null
                  ? const SizedBox()
                  : Text(
                      widget.numOfMails.toString(),
                      style: TextStyle(color: kiconColor),
                    ),
              _isExpanded
                  ? Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kinProgressStatus,
                      size: 32,
                    )
                  : Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: kiconColor,
                      size: 32,
                    ),
            ],
          ),
        ),
        if (_isExpanded) widget.body,
      ],
    );
  }
}
