import 'package:finn/features/presentation/widgets/dict_list.dart';
import 'package:finn/features/presentation/widgets/language_buttons_row.dart';
import 'package:finn/features/presentation/widgets/language_dropdown_menu.dart';
import 'package:finn/features/presentation/widgets/search_field.dart';
import 'package:finn/presentation/common/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dictionary extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
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
