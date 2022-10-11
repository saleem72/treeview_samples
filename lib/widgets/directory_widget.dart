import 'package:flutter/material.dart';

import '../utils/utils.dart';

class DirectoryWidget extends StatelessWidget {
  final String directoryName;
  final DateTime lastModified;
  final VoidCallback? onPressedNext;

  const DirectoryWidget({
    Key? key,
    required this.directoryName,
    required this.lastModified,
    this.onPressedNext,
  }) : super(key: key);

  Widget titleWidget() => Text(directoryName);
  Icon folderIcon() => const Icon(Icons.folder);

  IconButton expandButton() => IconButton(
        icon: const Icon(Icons.navigate_next),
        onPressed: onPressedNext,
      );

  Widget lastModifiedWidget() => Text(
        Utils.getFormattedDateTime(dateTime: lastModified),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: folderIcon(),
        title: titleWidget(),
        subtitle: lastModifiedWidget(),
        trailing: expandButton(),
        onTap: (() => print(directoryName)),
      ),
    );
  }
}
