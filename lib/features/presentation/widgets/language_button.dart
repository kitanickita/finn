import 'package:finn/domain/models/languages.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String label;

  final Color fromColor;
  final Color toColor;
  final VoidCallback onTap;
  final LanguageType language;
  final LanguageType buttonLanguage;
  const LanguageButton({
    required this.label,
    required this.fromColor,
    required this.toColor,
    required this.onTap,
    required this.language,
    required this.buttonLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: language == buttonLanguage ? 0 : 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        primary: Theme.of(context).primaryColor,
      ),
      onPressed: onTap,
      child: Row(
        children: [
          Text(label, style: TextStyle(color: fromColor)),
        ],
      ),
    );
  }
}
