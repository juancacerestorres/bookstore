import 'package:bookstore/src/books/models/book_model.dart';

class ListBooks {
  final String? error;
  final String? total;
  final String? page;
  final List<Book>? books;

  ListBooks({
    this.error,
    this.total,
    this.page,
    this.books,
  });

  ListBooks.fromJson(Map<String, dynamic> json)
      : error = json['error'] as String?,
        total = json['total'] as String?,
        page = json['page'] as String?,
        books = (json['books'] as List?)?.map((dynamic e) => Book.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() =>
      {'error': error, 'total': total, 'page': page, 'books': books?.map((e) => e.toJson()).toList()};
}
