import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shoryu_dev/ui/web_view_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TextWithLinkWidget extends StatelessWidget {
  const TextWithLinkWidget({super.key, required this.text});

  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextWithLink extends StatelessWidget {
  const TextWithLink({super.key, required this.text});

  final Text text;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);

    final content = text.data;
    final stringList = _extractURL(content!);
    final children = stringList
        .map(
          (string) => _textSpan(
            context,
            string,
          ),
        )
        .toList();

    return RichText(
      text: TextSpan(
        children: children,
        style: text.style,
      ),
      textAlign:
          text.textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
      textDirection: text.textDirection,
      locale: text.locale,
      softWrap: text.softWrap ?? defaultTextStyle.softWrap,
      overflow: text.overflow ?? defaultTextStyle.overflow,
      textScaleFactor:
          text.textScaleFactor ?? MediaQuery.textScaleFactorOf(context),
      maxLines: text.maxLines ?? defaultTextStyle.maxLines,
      strutStyle: text.strutStyle,
      textWidthBasis: text.textWidthBasis ?? defaultTextStyle.textWidthBasis,
      textHeightBehavior: text.textHeightBehavior ??
          defaultTextStyle.textHeightBehavior ??
          DefaultTextHeightBehavior.of(context),
    );
  }

  TextSpan _textSpan(BuildContext context, String text) {
    final scheme = Uri.tryParse(text)?.scheme;
    final isURL = scheme == 'https' || scheme == 'http';
    final recognizer = TapGestureRecognizer()
      ..onTap = () => _open(context: context, url: text, title: text);

    return TextSpan(
      text: text,
      style: isURL ? const TextStyle(color: Colors.blueAccent) : null,
      recognizer: isURL ? recognizer : null,
    );
  }

  List<String> _extractURL(String text) {
    final urlRegExp = RegExp(
      r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?',
    );
    final matches = urlRegExp.allMatches(text);

    final result = <String>[];
    var remaining = text;

    for (final match in matches) {
      final url = text.substring(match.start, match.end);
      final splittedText = remaining.split(url);
      result
        ..add(splittedText[0])
        ..add(url);
      remaining = splittedText.last;
    }
    result
      ..add(remaining)
      ..removeWhere((e) => e == '');
    return result;
  }

  bool _canOpenInWebView(String url) {
    final uri = Uri.parse(url);
    return uri.scheme == 'https';
  }

  Future<void> _open({
    required BuildContext context,
    required String url,
    required String title,
  }) async {
    if (_canOpenInWebView(url)) {
      await Navigator.of(context).push<void>(
        MaterialPageRoute<void>(
          builder: (_) => WebViewPage(url: url, title: title),
        ),
      );
    }
    try {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
