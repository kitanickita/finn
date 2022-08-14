import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/features/target_language/shared/providers.dart';
import 'package:finn/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageDropdownMenu extends ConsumerStatefulWidget {
  const LanguageDropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LanguageDropdownMenuState();
}

class _LanguageDropdownMenuState extends ConsumerState<LanguageDropdownMenu> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(dictProvider.notifier).initTargetLanguage(),
    );
  }

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
        final state = ref.watch(dictProvider);
        return DropdownButton<LanguageType>(
          hint: Text(
              "${state.translation.flag} ${LanguageType.getLocalizedShortName(state.translation, context)}"),
          items: [
            ...List.generate(
              languagePicker.length,
              (index) => DropdownMenuItem(
                value: languagePicker[index],
                child: Text(
                    "${languagePicker[index].flag} ${LanguageType.getLocalizedShortName(languagePicker[index], context)}"),
              ),
            ),
          ],
          onChanged: (value) {
            ref.read(dictProvider.notifier).translationSearchUpdate(value);
            ref
                .read(targetLanguageStateNotifierProvider.notifier)
                .setTargetLanguage(value!);
          },
        );
      },
    );
  }
}
