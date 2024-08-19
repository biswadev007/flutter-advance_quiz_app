class QuizeQuestions {
  const QuizeQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> suffeledList() {
    final suffeledListItem = List.of(answers);
    suffeledListItem.shuffle();

    return suffeledListItem;
  }
}
