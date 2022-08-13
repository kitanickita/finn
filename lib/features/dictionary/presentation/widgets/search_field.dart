import 'package:finn/common/themes/light_theme.dart';
import 'package:finn/localization/app_localization.dart';
import 'package:finn/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              ref.read(dictProvider.notifier).resetSearchField();
              controller.text = '';
            },
            icon: Icon(
              Icons.cancel,
              color: kRed.withOpacity(0.7),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          fillColor: Theme.of(context).primaryColor,
          filled: true,
          hintText: context.localize('search'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0.8,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        onChanged: (value) =>
            ref.read(dictProvider.notifier).searchDictForWords(value),
      ),
    );
  }
}
