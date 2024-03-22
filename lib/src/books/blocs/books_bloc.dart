import 'package:bookstore/src/books/models/book_model.dart';
import 'package:bookstore/src/books/provider/books_provider.dart';
import 'package:flutter/material.dart';

class BooksBloc{
  final ValueNotifier<Book?> bookNotifier = ValueNotifier(null);

  final bookProvider = BooksProvider();

  searchBookById(String id) async{
    final response = await bookProvider.searchBookById(id);
    if(response != null){
      Book book = Book.fromJson(response);
      bookNotifier.value = book;
    }
  }
}