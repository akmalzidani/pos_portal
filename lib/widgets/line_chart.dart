import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_portal/pages/home/stats_page.dart';
import 'package:pos_portal/utils/colors.dart';

class LineChart extends StatelessWidget {
  const LineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Container(
        color: MyColors.neutral,
        height: 250,
      ),
    );
  }
}
