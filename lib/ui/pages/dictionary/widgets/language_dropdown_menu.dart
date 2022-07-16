import 'package:finn/models/language_models/language.dart';
import 'package:finn/models/language_models/languages.dart';
import 'package:finn/models/providers/dict/dict_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finn/localization/app_localization.dart';

class LanguageDropdownMenu extends StatefulWidget {
  const LanguageDropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  _LanguageDropdownMenuState createState() => _LanguageDropdownMenuState();
}

class _LanguageDropdownMenuState extends State<LanguageDropdownMenu> {
  final List<Languages> languagePicker = [
    Languages.english,
    Languages.french,
    Languages.german,
    Languages.russian
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.read(dictProvider);
        return DropdownButton<Languages>(
          hint: Text(
              "${_getFlag(state.translation)} ${context.localize(_getLanguage(state.translation))}"),
          items: [
            ...List.generate(
              languagePicker.length,
              (index) => DropdownMenuItem(
                value: languagePicker[index],
                child: Text(
                    "${_getFlag(state.translation)} ${context.localize(_getLanguage(languagePicker[index]))}"),
              ),
            ),
          ],
          onChanged: (value) {
            ref.read(dictProvider.notifier).translationSearchUpdate(value);
          },
        );
      },
    );
  }

  String _getFlag(Languages translation) {
    return languages[translation]?.flag ?? '';
  }

  String _getLanguage(Languages translation) {
    return languages[translation]?.language ?? '';
  }
}
