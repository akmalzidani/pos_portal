import 'package:flutter/material.dart';
import 'package:pos_portal/layouts/body_template.dart';
import 'package:pos_portal/widgets/floating_button.dart';
import 'package:pos_portal/widgets/input_field.dart';
import 'package:pos_portal/widgets/snackbar.dart';
import 'package:pos_portal/widgets/topbar.dart';

class EditStruk extends StatefulWidget {
  EditStruk({Key? key}) : super(key: key);

  @override
  State<EditStruk> createState() => _EditStrukState();
}

class _EditStrukState extends State<EditStruk> {
  final TextEditingController headerController = TextEditingController();

  final TextEditingController footerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
        context: context,
        title: 'Edit Struk',
        isCanBack: true,
        onBackPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.of(context).pop();
        },
      ),
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
                onChanged: (p0) {
                  setState(() {
                    print(
                        "foote contol : ${footerController.text} header contol : ${headerController.text}");
                  });
                },
              ),
              InputField(
                label: 'Masukkan Footer Struk',
                controller: footerController,
                hintText: 'Isikan footer disini',
                isMultiLine: true,
                onChanged: (p0) {
                  setState(() {
                    print(
                        "foote contol : ${footerController.text} header contol : ${headerController.text}");
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtonDefault(
        title: 'Simpan',
        actionPressed: () {
          if (headerController.text.isEmpty && footerController.text.isEmpty) {
            showCustomSnackbar(
              context: context,
              message: 'Header dan Footer tidak boleh kosong',
              title: 'Input tidak valid',
              theme: SnackbarTheme.error,
            );
          } else if (footerController.text.isEmpty) {
            showCustomSnackbar(
              context: context,
              message: 'Footer tidak boleh kosong',
              title: 'Input tidak valid',
              theme: SnackbarTheme.error,
            );
          } else if (headerController.text.isEmpty) {
            showCustomSnackbar(
              context: context,
              message: 'Header tidak boleh kosong',
              title: 'Input tidak valid',
              theme: SnackbarTheme.error,
            );
          } else {
            debugPrint('Terprint');
          }
        },
        isFilled: true,
        isDisabled:
            (headerController.text.isEmpty || footerController.text.isEmpty),
        heroTag: 'saveHeaderFooterStruk',
      ),
    );
  }
}
