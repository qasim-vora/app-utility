class FaqDummyModel {
  final int? id;
  final String? question;
  final String? answer;
  bool isExpanded;

  FaqDummyModel({
    this.id,
    this.question,
    this.answer,
    this.isExpanded = false,
  });
}
