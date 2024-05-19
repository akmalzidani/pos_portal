import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/input_field.dart';
import 'package:pos_portal/widgets/save_button.dart';
import 'package:pos_portal/widgets/topbar.dart';

class EditStruk extends StatelessWidget {
  final TextEditingController headerController = TextEditingController();
  final TextEditingController footerController = TextEditingController();
  EditStruk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context: context, title: 'Edit Struk'),
      body: BodyTemplate(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                label: 'Masukkan Header Struk',
                controller: headerController,
                hintText: 'Isikan header disini',
                isMultiLine: true,
              ),
              InputField(
                label: 'Masukkan Footer Struk',
                controller: headerController,
                hintText: 'Isikan footer disini',
                isMultiLine: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtonDefault(
        title: 'Simpan',
        actionPressed: () {
          if (headerController.text.isNotEmpty &&
              footerController.text.isNotEmpty) {
            // Save to database
          }
        },
        isFilled: true,
        isDisabled: !headerController.text.isNotEmpty &&
            !footerController.text.isNotEmpty,
        heroTag: 'saveHeaderFooterStruk',
      ),
    );
  }
}
