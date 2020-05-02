class Shopping implements Comparable {
  int id;
  String title;
  String description;
  bool isDeleted;
  bool isBuy;

  Shopping({this.id, this.title, this.description, this.isDeleted, this.isBuy});

  @override
  int compareTo(other) {
    if (this.isBuy == null || this.isBuy == true) {
      return 1;
    }

    if (this.isBuy == false) {
      return -1;
    }

    return null;
  }
}
