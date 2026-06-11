class Book {
  String title;
  String author;
  double price;

  Book({
    required this.title,
    required this.author,
    required this.price,
  });

  void displayDetails() {
    print("Title : $title");
    print("Author: $author");
    print("Price : ₹$price");
    print("------------------");
  }
}

void main() {
  Book book1 = Book(
    title: "Flutter Basics",
    author: "Karpagam",
    price: 299,
  );

  Book book2 = Book(
    title: "Dart Programming",
    author: "Arun",
    price: 399,
  );

  book1.displayDetails();
  book2.displayDetails();
}