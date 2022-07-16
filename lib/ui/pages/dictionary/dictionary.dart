import 'package:finn/localization/app_localization.dart';
import 'package:finn/ui/pages/dictionary/widgets/search_field.dart';
import 'package:flutter/material.dart';

import 'package:finn/ui/common/constants/icons.dart';
import 'package:finn/ui/common/size_config.dart';
import 'package:finn/ui/pages/dictionary/widgets/language_buttons_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/providers/dict/dict_provider.dart';
import '../../common/themes/light_theme.dart';
import 'widgets/dict_list.dart';
import 'widgets/language_dropdown_menu.dart';

class Dictionary extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    // SizeConfig().init(context);
    final double blockSizeVertical = MediaQuery.of(context).size.height / 100;
    final double blockSizeHorizontal = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            SearchField(),
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
