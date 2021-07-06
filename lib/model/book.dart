import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  final String author;
  final String notes;
  final String categories;
  final String description;

  Book(
      {required this.id,
      required this.author,
      required this.notes,
      required this.categories,
      required this.description});

  factory Book.fromDocument(QueryDocumentSnapshot data) {
    return Book(
        id: data.id,
        author: data.get('author'),
        notes: data.get('notes'),
        categories: data.get('categories'),
        description: data.get('description'));
  }
}
