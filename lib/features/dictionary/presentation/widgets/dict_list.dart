import 'package:auto_size_text/auto_size_text.dart';
import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/common/themes/light_theme.dart';
import 'package:finn/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:substring_highlight/substring_highlight.dart';

class DictList extends StatelessWidget {
  const DictList({
    Key? key,
    required this.blockSizeVertical,
    required this.blockSizeHorizontal,
  }) : super(key: key);

  final double blockSizeVertical;
  final double blockSizeHorizontal;

  @override
  Widget build(BuildContext context) {
    final double blockSizeVertical = MediaQuery.of(context).size.height / 100;
    final double blockSizeHorizontal = MediaQuery.of(context).size.width / 100;
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(dictProvider);

        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: state.words == null || state.search == ''
                ? const SizedBox.shrink()
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    shrinkWrap: true,
                    itemCount: state.words.length,
                    itemBuilder: (BuildContext context, int index) {
                      final word = state.words[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: blockSizeVertical / 3.5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kWhite,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: blockSizeVertical / 2.5),
                                child: GestureDetector(
                                  // onTap: () => _goToWordInfo(
                                  //     context: context, word: word),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: blockSizeVertical * 55 / 9,
                                        width: blockSizeHorizontal * 35,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: blockSizeHorizontal * 3),
                                          child: state.language ==
                                                  LanguageType.finnish
                                              ? SubstringHighlight(
                                                  text: word.finnish,
                                                  term: state.search,
                                                )
                                              : AutoSizeText(
                                                  word.finnish,
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyText1,
                                                  maxLines: 2,
                                                ),
                                        ),
                                      ),
                                      Container(
                                        height: blockSizeVertical * 50 / 9,
                                        width: blockSizeHorizontal / 2,
                                        color: kRed.withOpacity(0.4),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: blockSizeVertical * 55 / 9,
                                        width: blockSizeHorizontal * 53,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: blockSizeHorizontal * 3),
                                          child: state.language !=
                                                  LanguageType.finnish
                                              ? SubstringHighlight(
                                                  text: word.translation,
                                                  term: state.search,
                                                )
                                              : AutoSizeText(
                                                  word.translation,
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyText1,
                                                  maxLines: 2,
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
