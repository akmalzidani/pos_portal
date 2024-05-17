import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/button.dart';
import 'package:pos_portal/widgets/topbar.dart';

import '../../widgets/customTextField.dart';

class EditWebhook extends StatefulWidget {
  const EditWebhook({Key? key}) : super(key: key);

  @override
  _EditWebhookState createState() => _EditWebhookState();
}

class _EditWebhookState extends State<EditWebhook> {
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
      appBar: topBar(context: context, title: 'Edit Webhook / Qris'),
      body: BodyTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Konten berada di kiri
              children: [
                Text(
                  'Masukkan link WebHook',
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
                  labelText: 'WebHook Link',
                  hintText: 'Isi Webhook anda',
                ),
              ],
            ),
            SizedBox(height: 20), // Spasi antara kolom
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
