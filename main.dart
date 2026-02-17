import 'dart:io';

import 'controller.dart';
import 'lib/message_util.dart';

void main() {
  Controller app = Controller();
  while (true) {
    app.showMenu();

    stdout.write("Masukkan pilihan: ");
    String input = stdin.readLineSync() ?? '';

    int? choice = int.tryParse(input);

    if (choice == null) {
      message("Input harus berupa angka!", MessageType.error);
      continue;
    }

    switch (choice) {
      case 1:
        app.create();
        break;

      case 2:
        app.show();
        break;

      case 3:
        app.select();
        break;

      case 4:
        app.delete();
        break;

      case 5:
      message("Terimakasih telah menggunakan program ini", MessageType.success);
        return;

      default:
      message("Pilihan tidak tersedia", MessageType.warning);
    }
  }
}
