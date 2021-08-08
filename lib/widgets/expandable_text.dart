import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text, {this.trimLines = 2});

  final String text;
  final String ellipsizeText = '...';
  final String readMoreText = ' もっと見る';
  final String readLessText = ' 閉じる';
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapReadMoreOrLess() {
    setState(() => _readMore = !_readMore);
  }

  final colorClickableText = Color(0xFF00ADFE);
  final textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final readMoreOrLessTextSp = TextSpan(
      text: _readMore ? widget.readMoreText : widget.readLessText,
      style: TextStyle(color: colorClickableText),
      recognizer: TapGestureRecognizer()..onTap = _onTapReadMoreOrLess,
    );
    final ellipsizeTextSp = TextSpan(
      text: widget.ellipsizeText,
      style: DefaultTextStyle.of(context).style,
    );
    final textSp = TextSpan(
      text: widget.text,
      style: DefaultTextStyle.of(context).style,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);

        final textPainter = TextPainter(
          text: readMoreOrLessTextSp,
          textDirection: TextDirection.ltr,
          maxLines: widget.trimLines,
        )..layout(
            minWidth: constraints.minWidth,
            maxWidth: constraints.maxWidth,
          );
        final readMoreOrLessTextSize = textPainter.size;

        textPainter.text = textSp;
        textPainter.layout(
          minWidth: constraints.minWidth,
          maxWidth: constraints.maxWidth,
        );
        final textSize = textPainter.size;

        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - readMoreOrLessTextSize.width,
          textSize.height,
        ));
        final endIndex = textPainter.getOffsetBefore(pos.offset);

        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: DefaultTextStyle.of(context).style,
            children: _readMore
                ? <TextSpan>[
                    ellipsizeTextSp,
                    readMoreOrLessTextSp,
                  ]
                : <TextSpan>[
                    readMoreOrLessTextSp,
                  ],
          );
        } else {
          textSpan = textSpan = TextSpan(
            text: widget.text,
            style: DefaultTextStyle.of(context).style,
          );
        }

        return RichText(
          text: textSpan,
          overflow: TextOverflow.ellipsis,
          maxLines: _readMore ? widget.trimLines : null,
        );
      },
    );
  }
}
