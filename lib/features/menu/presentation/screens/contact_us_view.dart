import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manager.dart';
import '../widgets/contact_methods.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.contactUs),
      ),
      body: const ContactMethods(),
    );
  }
}
