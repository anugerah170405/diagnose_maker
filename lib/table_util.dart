class Table {
  final String title;
  final List list;
  final int lineLength;

  Table({required this.title, required this.list, this.lineLength = 50});

  void render() {
    print('╭${'─' * lineLength}╮');
    print('│${' ' * lineLength}│');
    print('│${_center(title.toUpperCase())}│');
    print('│${' ' * lineLength}│');
    print('├${'─' * lineLength}┤');

    for (int i = 0; i < list.length; i++) {
      print('│ ${i + 1}.  ${list[i].padRight(lineLength - 6)} │');
    }

    print('╰${'─' * lineLength}╯');
  }

  String _center(String text) {
    int totalSpace = lineLength - text.length;
    int left = totalSpace ~/ 2;
    int right = totalSpace - left;

    return ' ' * left + text + ' ' * right;
  }
}
