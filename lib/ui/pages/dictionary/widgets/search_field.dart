import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finn/localization/app_localization.dart';
import 'package:finn/models/providers/dict/dict_provider.dart';
import 'package:finn/ui/common/themes/light_theme.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(dictProvider);
        controller = TextEditingController(text: state.search);
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // width: widget.blockSizeHorizontal * 90,
          height: 70,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(dictProvider.notifier).resetSearchField();
                },
                icon: Icon(
                  Icons.cancel,
                  color: kRed.withOpacity(0.7),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              fillColor: Theme.of(context).primaryColor,
              filled: true,
              hintText: context.localize('search'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            onChanged: (value) =>
                ref.read(dictProvider.notifier).searchDictForWords(value),
          ),
        );
      },
    );
  }
}
