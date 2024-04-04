class RecordResult {
  final String date;
  final String title;
  final String time;
  final String count;
  final List<String> itemList;
  final List<String> itemDescriptionList;
  final String fullText;

  RecordResult({
    required this.date,
    required this.title,
    required this.time,
    required this.count,
    required this.itemList,
    required this.itemDescriptionList,
    required this.fullText,
  });
}