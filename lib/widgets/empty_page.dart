import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String title;
  const EmptyList({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      // height: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        padding: EdgeInsets.all(48),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            color: Color(0xFF838589),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
