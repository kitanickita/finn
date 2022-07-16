import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:finn/localization/app_localization.dart';
import 'package:finn/domain/models/language.dart';
import 'package:finn/domain/models/languages.dart';
import 'package:finn/application/dict_provider.dart';
import 'package:finn/presentation/common/themes/light_theme.dart';
import 'package:finn/presentation/pages/dictionary/widgets/language_button.dart';

import '../../../../shared/providers.dart';

class LanguageButtonsRow extends StatelessWidget {
  const LanguageButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(dictProvider);
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
                  ref
                      .read(dictProvider.notifier)
                      .languageSearchUpdate(Languages.finnish);
                  ref.read(dictProvider.notifier).resetSearchField();
                },
                language: state.language,
                buttonLanguage: Languages.finnish,
              ),
              LanguageButton(
                label:
                    '${languages[state.translation]?.flag ?? ''} ${context.localize(languages[state.translation]?.shortName ?? '')}',
                fromColor: kOrange,
                toColor: kBlue,
                onTap: () {
                  ref
                      .read(dictProvider.notifier)
                      .languageSearchUpdate(Languages.english);
                  ref.read(dictProvider.notifier).resetSearchField();
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
