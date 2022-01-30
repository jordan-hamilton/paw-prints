import 'entry.dart';

class Memories {
  
  final List<Entry>? entries;
  
  const Memories({this.entries});

  int get entryCount => entries!.length;
}
