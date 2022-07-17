import 'package:finn/features/dictionary/domain/language.dart';
import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/localization/app_localization.dart';
import 'package:finn/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageDropdownMenu extends StatefulWidget {
  const LanguageDropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  _LanguageDropdownMenuState createState() => _LanguageDropdownMenuState();
}

class _LanguageDropdownMenuState extends State<LanguageDropdownMenu> {
  final List<LanguageType> languagePicker = [
    LanguageType.english,
    LanguageType.french,
    LanguageType.german,
    LanguageType.russian
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.read(dictProvider);
        return DropdownButton<LanguageType>(
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

  String _getFlag(LanguageType translation) {
    return languages[translation]?.flag ?? '';
  }

  String _getLanguage(LanguageType translation) {
    return languages[translation]?.language ?? '';
  }
}
