//

import 'package:flutter/material.dart';

import '../utils/utils.dart';

class FileWidget extends StatelessWidget {
  final String fileName;
  final DateTime lastModified;

  const FileWidget({
    Key? key,
    required this.fileName,
    required this.lastModified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget fileNameWidget = Text(fileName);
    Widget lastModifiedWidget = Text(
      Utils.getFormattedDateTime(dateTime: lastModified),
    );
    Icon fileIcon = const Icon(Icons.insert_drive_file);

    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: fileIcon,
        title: fileNameWidget,
        subtitle: lastModifiedWidget,
        onTap: (() => print(fileName)),
      ),
    );
  }
}
