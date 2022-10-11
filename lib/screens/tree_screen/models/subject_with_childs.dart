//

import 'subject.dart';

class SubjectWithChilds {
  final int id;
  final int? parentId;
  final String title;
  final List<SubjectWithChilds> childs;
  SubjectWithChilds({
    required this.id,
    this.parentId,
    required this.title,
    this.childs = const [],
  });

  factory SubjectWithChilds.fromSubject(Subject subject) {
    return SubjectWithChilds(
      id: subject.id,
      parentId: subject.parentId,
      title: subject.title,
      childs: [],
    );
  }
  @override
  String toString() =>
      'parentId: $parentId, id: $id, title: $title, childs count: ${childs.length}';
}
