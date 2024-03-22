import 'package:bookstore/common/redirect_service.dart';
import 'package:bookstore/common/styles/custom_button.dart';
import 'package:bookstore/src/books/blocs/books_bloc.dart';
import 'package:bookstore/src/books/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DescriptionBook extends StatelessWidget {
  BooksBloc booksBloc = BooksBloc();

  DescriptionBook({super.key, required this.idBook}) {
    booksBloc.searchBookById(idBook);
  }

  final String idBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            RedirectService.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Securing DevOps'),
      ),
      body: ValueListenableBuilder(
        valueListenable: booksBloc.bookNotifier,
        builder: (BuildContext context, Book? value, Widget? child) {
          if(value == null){
            return const Center(child:  CircularProgressIndicator(),);
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      value.image ?? "",
                      fit: BoxFit.cover,
                      width: 270.0,
                      height: 283.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  value.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Autor: ${value.authors ?? ""}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  value.publisher ?? "",
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'paginas: ${value.pages ?? ""}',
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'year: ${value.year ?? ""}',
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'rating: ${value.rating ?? ""}',
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'description: ${value.desc ?? ""}',
                  maxLines: 9,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'precio: ${value.price ?? ""}',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if(value.pdf?.chapter2 != null || value.pdf?.chapter5 != null)...[
                  SizedBox(
                    width: 90.0,
                    child: CustomButton.button(
                      title: const Text("PDF"),
                      onPressed: () {
                        _launchURL(value.pdf?.chapter2 ?? value.pdf?.chapter5 ?? "");
                      },
                    ),
                  ),
                ]
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String urlData) async {
    final url = Uri.parse(urlData);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }
}
