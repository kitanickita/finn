import 'package:finn/ui/pages/dictionary/widgets/search_field.dart';
import 'package:flutter/material.dart';

import 'package:finn/ui/common/constants/icons.dart';
import 'package:finn/ui/common/size_config.dart';
import 'package:finn/ui/pages/dictionary/widgets/language_buttons_row.dart';

import 'widgets/dict_list.dart';
import 'widgets/language_dropdown_menu.dart';

class Dictionary extends StatefulWidget {
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double blockSizeVertical = SizeConfig.blockSizeVertical;
    final double blockSizeHorizontal = SizeConfig.blockSizeHorizontal;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        centerTitle: true,
        title: logo,
        actions: const [
          LanguageDropdownMenu(),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            const LanguageButtonsRow(),
            const SearchField(),
            DictList(
              blockSizeVertical: blockSizeVertical,
              blockSizeHorizontal: blockSizeHorizontal,
            )
          ],
        ),
      ),
    );
  }
}
