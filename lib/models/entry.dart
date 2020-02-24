class Entry {
  String title;
  String description;
  DateTime dateTime;
  double rating;
  String toString() {
    return 'Title: $title, Description: $description, Time: $dateTime, Rating: $rating';
  }
}