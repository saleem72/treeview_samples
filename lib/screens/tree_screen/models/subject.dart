//

class Subject {
  final int id;
  final int? parentId;
  final String title;
  Subject({
    required this.id,
    this.parentId,
    required this.title,
  });

  @override
  String toString() => 'parentId: $parentId, id: $id, title: $title';

  static List<Subject> dummyData() => [
        Subject(id: 10, title: 'Red Tshirt', parentId: 6),
        Subject(id: 5, title: 'Bread', parentId: 1),
        Subject(id: 6, title: 'Shirts', parentId: 3),
        Subject(id: 1, title: 'Food', parentId: null),
        Subject(id: 2, title: 'Electrical', parentId: null),
        Subject(id: 8, title: 'TV', parentId: 2),
        Subject(id: 4, title: 'Banana', parentId: 1),
        Subject(id: 11, title: 'Green Tshirt', parentId: 6),
        Subject(id: 7, title: 'Dress', parentId: 3),
        Subject(id: 9, title: 'Microwave', parentId: 2),
        Subject(id: 3, title: 'Clothes', parentId: null),
      ];
}
