import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedDateFormatter {
  final DateTime lastUpdated;

  LastUpdatedDateFormatter({@required this.lastUpdated});

  String lastUpdatedText() {
    if(lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formatted = formatter.format(lastUpdated);
      return 'Last updated: $formatted';
    }
    return '';
  }
}

class LastUpdatedStatusText extends StatelessWidget {
  final String text;

  const LastUpdatedStatusText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
