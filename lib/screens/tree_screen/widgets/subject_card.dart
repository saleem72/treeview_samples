//

import 'package:flutter/material.dart';

import '../models/subject_with_childs.dart';

class SubjectCard extends StatefulWidget {
  const SubjectCard({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final SubjectWithChilds subject;

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          _subjectTitle(),
          isCollapsed ? const SizedBox.shrink() : _childsSection(),
        ],
      ),
    );
  }

  Widget _childsSection() {
    return widget.subject.childs.isNotEmpty
        ? _childs()
        : const SizedBox.shrink();
  }

  Widget _childs() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children:
            widget.subject.childs.map((e) => SubjectCard(subject: e)).toList(),
      ),
    );
  }

  Widget _subjectTitle() {
    return SizedBox(
      height: 56,
      // padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.subject.title),
          widget.subject.childs.isNotEmpty
              ? IconButton(
                  onPressed: () => setState(() {
                        isCollapsed = !isCollapsed;
                      }),
                  icon: const Icon(Icons.chevron_right))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class Something extends StatelessWidget {
  const Something({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final display = MediaQuery.of(context).size.height.toInt().toString();
    return Container(
      width: 30,
      // height: double.maxFinite,
      color: Colors.pink,
      alignment: Alignment.center,
      child: Text(display),
      // alignment: Alignment.center,
      // child: const VerticalDivider(
      //   color: Colors.black,
      //   width: 2,
      // ),
    );
  }
}
