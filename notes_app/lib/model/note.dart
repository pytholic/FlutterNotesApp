// class NotesFields {
//   static const List<String> values = [title, description];
// }

class Note {
  final int? id;
  final int number;
  String title;
  String description;
  final DateTime createdTime;

  // Constructor
  Note({
    this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });
}
