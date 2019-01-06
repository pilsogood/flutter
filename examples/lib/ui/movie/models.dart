class Data {
  
  final String title;
  final String description;
  final String author;
  final String image;
  final double rating;
  final int star;
  final List<String> categories;
  final List<String> pictures;
  final List<People> peoples;
  
  Data({
    this.title,
    this.description,
    this.author,
    this.image,
    this.rating,
    this.star,
    this.categories,
    this.pictures,
    this.peoples,
  });
}

class People {
  final String name;
  final String image;

  People({
    this.name,
    this.image
  });
}