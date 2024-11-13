abstract class Iterator<T> {
  bool hasNext();
  T next();
}
abstract class IterableCollection<T> {
  Iterator<T> createIterator();
}
class Book {
  final String title;

  Book(this.title);
}

class BookCollection implements IterableCollection<Book> {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  @override
  Iterator<Book> createIterator() {
    return BookIterator(_books);
  }
}
class BookIterator implements Iterator<Book> {
  final List<Book> _books;
  int _currentIndex = 0;

  BookIterator(this._books);

  @override
  bool hasNext() {
    return _currentIndex < _books.length;
  }

  @override
  Book next() {
    if (!hasNext()) {
      throw Exception('No more books.');
    }
    return _books[_currentIndex++];
  }
}
void main() {
  BookCollection bookCollection = BookCollection();
  bookCollection.addBook(Book('Design Patterns in Dart'));
  bookCollection.addBook(Book('Clean Code'));
  bookCollection.addBook(Book('The Pragmatic Programmer'));

  Iterator<Book> iterator = bookCollection.createIterator();

  while (iterator.hasNext()) {
    Book book = iterator.next();
    print('Reading book: ${book.title}');
  }
}
