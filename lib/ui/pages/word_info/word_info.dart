import 'package:auto_size_text/auto_size_text.dart';
import 'package:finn/ui/common/constants/icons.dart';
import 'package:flutter/material.dart';

import 'package:finn/models/word_models/word_model.dart';
import 'package:finn/ui/common/size_config.dart';
import 'package:finn/ui/common/themes/light_theme.dart';

class WordInfo extends StatelessWidget {
  final Word word;

  const WordInfo({Key key, this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double blockSizeVertical = SizeConfig.blockSizeVertical;
    final double blockSizeHorizontal = SizeConfig.blockSizeHorizontal;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: logo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 190,
                    child: AutoSizeText(
                      word.finnish,
                      style: Theme.of(context).primaryTextTheme.headline5,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "KP: ${word.chapter}",
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: blockSizeHorizontal * 90,
                height: blockSizeVertical * 70,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
