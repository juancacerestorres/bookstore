import 'package:bookstore/src/books/models/list_books_model.dart';
import 'package:bookstore/src/books/provider/books_provider.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  final ValueNotifier<ListBooks?> listBooksNotifier = ValueNotifier(null);

  final bookProvider = BooksProvider();

  loadBook(String text) async {
    final response = await bookProvider.searchBookByText(text);
    if (response != null) {
      ListBooks listBooks = ListBooks.fromJson(response);
      listBooksNotifier.value = listBooks;
    }
  }
}
