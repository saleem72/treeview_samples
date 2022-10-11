// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:flutter/material.dart';

import 'models/subject.dart';
import 'models/subject_with_childs.dart';
import 'widgets/subject_card.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen({Key? key}) : super(key: key);

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  List<SubjectWithChilds> subjects = [];

  @override
  void initState() {
    super.initState();
    initValues();
  }

  void initValues() {
    final allSubjects = Subject.dummyData()
        .map((e) => SubjectWithChilds.fromSubject(e))
        .toList();

    final sortedArray = _sort(allSubjects);

    setState(() {
      subjects = sortedArray;
    });
  }

  SubjectWithChilds? getParent(List<SubjectWithChilds> array, int id) {
    for (final subject in array) {
      if (subject.id == id) {
        return subject;
      }
    }

    for (final subject in array) {
      final parent = getParent(subject.childs, id);
      if (parent != null) {
        return parent;
      }
    }

    return null;
  }

  List<SubjectWithChilds> _sort(List<SubjectWithChilds> array) {
    final List<SubjectWithChilds> sortedArray = [];
    final nullList =
        array.where((element) => element.parentId == null).toList();
    final valueList =
        array.where((element) => element.parentId != null).toList();
    valueList.sort((a, b) => a.parentId!.compareTo(b.parentId!));

    sortedArray.addAll(nullList);
    sortedArray.addAll(valueList);

    final List<SubjectWithChilds> resultArray = [];
    for (final subject in sortedArray) {
      if (subject.parentId == null) {
        resultArray.add(subject);
      } else {
        // Fetch the parent
        final parent = getParent(resultArray, subject.parentId!);
        if (parent != null) {
          parent.childs.add(subject);
        }
      }
    }

    return resultArray;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort list'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: subjects.map((e) => SubjectCard(subject: e)).toList(),
        ),
      ),
    );
  }
}
