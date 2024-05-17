import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/button.dart';
import 'package:pos_portal/widgets/topbar.dart';

import '../../widgets/customTextField.dart';

class EditStruk extends StatefulWidget {
  const EditStruk({Key? key}) : super(key: key);

  @override
  _EditStrukState createState() => _EditStrukState();
}

class _EditStrukState extends State<EditStruk> {
  final TextEditingController _headerController = TextEditingController();
  final TextEditingController _footerController = TextEditingController();

  @override
  void dispose() {
    _headerController.dispose();
    _footerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Edit Struk'),
      body: BodyTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Konten berada di kiri
              children: [
                Text(
                  'Masukkan Header',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: _headerController,
                  labelText: 'Isikan Header Disini',
                  hintText: 'Isikan Header Disini',
                ),
              ],
            ),
            SizedBox(height: 20), // Spasi antara kolom
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Konten berada di kiri
              children: [
                Text(
                  'Masukkan Footer',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: _footerController,
                  labelText: 'Isikan Footer Disini',
                  hintText: 'Isikan Footer Disini',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonDefault(
        title: 'Simpan',
        onPressed: () {
          // Handle the save action
          // You can access the text from the controllers using _headerController.text and _footerController.text
        },
      ),
    );
  }
}
