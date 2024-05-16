import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/save_button.dart';
import 'package:pos_portal/widgets/topbar.dart';

import '../../widgets/customTextField.dart';

class EditStruk extends StatelessWidget {
  const EditStruk({Key? key}) : super(key: key);

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
                Text('Masukkan Header',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: TextEditingController(), // Anda perlu menambahkan controller
                  labelText: 'Isikan Header Disini',
                  hintText: 'Isikan Header Disini',
                ),
              ],
            ),
            SizedBox(height: 20), // Spasi antara kolom
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Konten berada di kiri
              children: [
                Text('Masukkan Footer',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: TextEditingController(), // Anda perlu menambahkan controller
                  labelText: 'Isikan Footer Disini',
                  hintText: 'Isikan Footer Disini',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonSave(title: 'Simpan'),

    );
  }
}
