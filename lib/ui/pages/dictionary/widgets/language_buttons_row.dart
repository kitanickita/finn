import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:finn/localization/app_localization.dart';
import 'package:finn/models/language_models/language.dart';
import 'package:finn/models/language_models/languages.dart';
import 'package:finn/models/providers/dict/dict_provider.dart';
import 'package:finn/ui/common/themes/light_theme.dart';
import 'package:finn/ui/pages/dictionary/widgets/language_button.dart';

class LanguageButtonsRow extends StatelessWidget {
  const LanguageButtonsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(dictProvider.state);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LanguageButton(
                label: '🇫🇮   ${context.localize('FI')} ',
                fromColor: kBlue,
                toColor: kOrange,
                onTap: () {
                  context
                      .read(dictProvider)
                      .languageSearchUpdate(Languages.finnish);
                  context.read(dictProvider).resetSearchField();
                },
                language: state.language,
                buttonLanguage: Languages.finnish,
              ),
              LanguageButton(
                label:
                    '${languages[state.translation]?.flag}  ${context.localize(languages[state.translation]?.shortName)}',
                fromColor: kOrange,
                toColor: kBlue,
                onTap: () {
                  context
                      .read(dictProvider)
                      .languageSearchUpdate(Languages.english);
                  context.read(dictProvider).resetSearchField();
                },
                language: state.language,
                buttonLanguage: Languages.english,
              ),
            ],
          ),
        );
      },
    );
  }
}
