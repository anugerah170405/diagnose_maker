import './colors_util.dart';

enum MessageType {info, success, warning, error}

void message(String text, MessageType msgType) {
  String msg;
  switch (msgType) {
    case MessageType.info:
      msg = '${color('Info: ', Color.blue)}$text';
      break;
    case MessageType.success:
      msg = color(text, Color.green);
      break;
    case MessageType.warning:
      msg = '${color('Warning: ', Color.yellow)}$text';
      break;
    case MessageType.error:
      msg = '${color('Error: ', Color.red)}$text';
      break;
  }

  int length = msg.length-9;

  print('╭${'─' * (length + 2)}╮');
  print('│ $msg │');
  print('╰${'─' * (length + 2)}╯');
}
