import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/pages/settings/edit_struk_page.dart';
import 'package:pos_portal/utils/colors.dart';

import '../../widgets/topbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Pengaturan',
      ),
      body: BodyTemplate(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Edit Pin Aplikasi',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('Ubah Pin Masuk Aplikasi'),
              leading: SvgPicture.asset(
                'assets/svg/icon_gembok.svg',
                width: 24, // adjust the width as needed
                height: 24, // adjust the height as needed
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Edit Struk',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              subtitle: Text('Ubah Header dan Footer Struk'),
              leading: SvgPicture.asset(
                'assets/svg/icon_struk.svg',
                width: 24, // adjust the width as needed
                height: 24, // adjust the height as needed
              ),
              onTap: () {
                // Navigate to EditStruk page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditStruk()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
