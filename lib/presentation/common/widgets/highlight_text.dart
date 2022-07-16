// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';

// class HighlightText extends StatelessWidget {
//   final String? text;
//   final String? highlight;
//   final TextStyle? style;
//   final Color? highlightColor;

//   const HighlightText({
//     Key? key,
//     this.text,
//     this.highlight,
//     this.style,
//     this.highlightColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final String text = this.text ?? '';
//     if ((highlight?.isEmpty ?? true) || text.isEmpty) {
//       return Text(text, style: style);
//     }

//     final List<TextSpan> spans = [];
//     int start = 0;
//     int indexOfHighlight;
//     do {
//       indexOfHighlight = text.indexOf(highlight ?? '', start);
//       if (indexOfHighlight < 0) {
//         // no highlight
//         spans.add(_normalSpan(text.substring(start, text.length)));
//         break;
//       }
//       if (indexOfHighlight == start) {
//         // start with highlight.
//         spans.add(_highlightSpan(highlight ?? ''));
//         start += highlight?.length ?? 0;
//       } else {
//         // normal + highlight
//         spans.add(_normalSpan(text.substring(start, indexOfHighlight)));
//         spans.add(_highlightSpan(highlight ?? ''));
//         start = indexOfHighlight + highlight?.length ?? 0;
//       }
//     } while (true);

//     return AutoSizeText.rich(TextSpan(children: spans));
//   }

//   TextSpan _highlightSpan(String content) {
//     return TextSpan(
//         text: content, style: style?.copyWith(color: highlightColor ?? ''));
//   }

//   TextSpan _normalSpan(String content) {
//     return TextSpan(text: content, style: style);
//   }
// }
