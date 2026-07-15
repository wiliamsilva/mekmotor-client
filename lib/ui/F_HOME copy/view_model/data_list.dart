List<ListWords> listWords = [
  ListWords(titlelist: 'oneWord', definitionlist: 'OneWord definition'),
  ListWords(titlelist: 'twoWord', definitionlist: 'TwoWord definition.'),
  ListWords(titlelist: 'TreeWord', definitionlist: 'TreeWord definition'),
];

class ListWords {
  late final String titlelist;
  late final String definitionlist;

  ListWords({required String titlelist, required String definitionlist}) {
    this.titlelist = titlelist;
    this.definitionlist = definitionlist;
  }

  @override
  String toString() {
    return "$titlelist - $definitionlist";
  }
}
