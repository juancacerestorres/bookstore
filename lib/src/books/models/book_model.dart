class Book {
  final String? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? isbn10;
  final String? isbn13;
  final String? pages;
  final String? year;
  final String? rating;
  final String? desc;
  final String? price;
  final String? image;
  final String? url;
  final Pdf? pdf;

  Book({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
    this.pdf,
  });

  Book.fromJson(Map<String, dynamic> json)
      : error = json['error'] as String?,
        title = json['title'] as String?,
        subtitle = json['subtitle'] as String?,
        authors = json['authors'] as String?,
        publisher = json['publisher'] as String?,
        isbn10 = json['isbn10'] as String?,
        isbn13 = json['isbn13'] as String?,
        pages = json['pages'] as String?,
        year = json['year'] as String?,
        rating = json['rating'] as String?,
        desc = json['desc'] as String?,
        price = json['price'] as String?,
        image = json['image'] as String?,
        url = json['url'] as String?,
        pdf = (json['pdf'] as Map<String, dynamic>?) != null ? Pdf.fromJson(json['pdf'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'error': error,
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'pages': pages,
        'year': year,
        'rating': rating,
        'desc': desc,
        'price': price,
        'image': image,
        'url': url,
        'pdf': pdf?.toJson()
      };
}

class Pdf {
  final String? chapter2;
  final String? chapter5;

  Pdf({
    this.chapter2,
    this.chapter5,
  });

  Pdf.fromJson(Map<String, dynamic> json)
      : chapter2 = json['Chapter 2'] as String?,
        chapter5 = json['Chapter 5'] as String?;

  Map<String, dynamic> toJson() => {'Chapter 2': chapter2, 'Chapter 5': chapter5};
}
