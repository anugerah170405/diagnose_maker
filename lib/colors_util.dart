enum Color { red, blue, green, yellow, cyan }

String color(String text, Color color) {
  switch (color) {
    case Color.red:
      return '\x1B[31m$text\x1B[0m';
    case Color.green:
      return '\x1B[32m$text\x1B[0m';
    case Color.yellow:
      return '\x1B[33m$text\x1B[0m';
    case Color.blue:
      return '\x1B[34m$text\x1B[0m';
    case Color.cyan:
      return '\x1B[35m$text\x1B[0m';
  }
}
