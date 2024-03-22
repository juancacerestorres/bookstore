import 'package:bookstore/common/globalFunctions.dart';
import 'package:bookstore/common/redirect_service.dart';
import 'package:bookstore/common/styles/custom_button.dart';
import 'package:bookstore/common/styles/custom_theme.dart';
import 'package:bookstore/common/styles/text_field_style.dart';
import 'package:bookstore/src/books/models/book_model.dart';
import 'package:bookstore/src/books/models/list_books_model.dart';
import 'package:bookstore/src/books/screens/description_book.dart';
import 'package:bookstore/src/home/blocs/home_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeBooks extends StatelessWidget {
  HomeBooks({super.key});

  HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox.shrink(), title: const Text('Libros')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 50.0),
            child: TextFormField(
              style: TextFieldStyle.textStyle(colorText: CustomTheme().colors.lightBlue),
              onChanged: (value) {
                homeBloc.loadBook(value);
              },
              maxLines: 1,
              decoration: TextFieldStyle.withIcon(
                labelText: "Buscar",
                leftIcon: Icon(
                  Icons.search,
                  color: CustomTheme().colors.darkBlue,
                ),
              ),
              cursorColor: CustomTheme().colors.darkBlue,
            ),
          ),
          SizedBox(
            height: 520.0,
            child: FutureBuilder(
              future: globalFunctions.isConnected(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data ?? false) {
                  return ValueListenableBuilder(
                    valueListenable: homeBloc.listBooksNotifier,
                    builder: (BuildContext context, ListBooks? value, Widget? child) {
                      if(value?.books == null || value?.books?.length == 0){
                        return const Center(child: Text('no hay resultados'),);
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: value?.books?.length ?? 0,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10.0,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return _book(context, value?.books![index]);
                        },
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('no tienes conexion a interet'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _book(BuildContext context, Book? book) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        width: 270.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    book!.image ?? "",
                    fit: BoxFit.cover,
                    width: 270.0,
                    height: 283.0,
                  ),
                ),
                Positioned(
                    right: 2.0,
                    bottom: 5.0,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50.0))),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 2.0,
                        ),
                        child: Text(book.price ?? ''))),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              book.title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 100.0,
              child: Text(
                book.subtitle ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 90.0,
              child: CustomButton.button(
                title: const Text("Ver más"),
                onPressed: () {
                  RedirectService.goTo(
                      context,
                      DescriptionBook(
                        idBook: book.isbn13 ?? "",
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
