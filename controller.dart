import 'dart:io';
import 'dart:convert';

import 'decisionTree.dart';
import 'model/diagnoseData.dart';
import 'lib/message_util.dart';
import 'lib/table_util.dart';

class Controller {
  final File _file = File('diagnosa.json');

  List<DiagnoseData> listData = [];

  Controller() {
    loadAll();
  }

  void showMenu() {
    Table table = Table(
      title: 'Pembuat Diagnosa',
      list: const [
        'Buat diagnosa baru',
        'Tampilkan semua diagnosa',
        'Jalankan diagnosa',
        'Hapus diagnosa',
        'Keluar',
      ],
    );

    table.render();
  }

  void create() {
    stdout.write("Masukan judul diagnosa: ");
    String title = stdin.readLineSync() ?? '';

    if (title.isEmpty) {
      message("Judul tidak boleh kosong!", MessageType.error);
      return;
    }

    DecisionTree builder = DecisionTree();
    DecisionTree? createdTree = builder.createQuestion();

    if (createdTree == null) {
      message("Pembuatan diagnosa dibatalkan", MessageType.warning);
      return;
    }

    listData.add(DiagnoseData(title: title, tree: createdTree));

    saveAll();

    message("Diagnosa baru berhasil dibuat", MessageType.success);
  }

  void show() {
    if (listData.isEmpty) {
      message("Belum ada diagnosa apapun!", MessageType.warning);
      return;
    }

    List<String> titles = listData.map((data) => data.title).toList();

    Table table = Table(title: 'Daftar Diagnosa', list: titles);

    table.render();
  }

  void select() {
    if (listData.isEmpty) {
      message("Belum ada diagnosa apapun!", MessageType.warning);
      return;
    }

    stdout.write("Pilih diagnose: ");
    String input = stdin.readLineSync() ?? '';

    int? index = int.tryParse(input);

    if (index == null) {
      message("Input harus berupa angka!", MessageType.error);
      return;
    }

    index -= 1;

    if (index < 0 || index >= listData.length) {
      message("Pilihan diagnosa tidak tersedia", MessageType.error);
      return;
    }

    DecisionTree? tree = listData[index].tree;

    String? result = tree!.diagnose();

    if (result == null || result.isEmpty) {
      message("Diagnosa yang dipilih tidak lengkap.", MessageType.error);
      return;
    }

    message("Kesimpulan: $result", MessageType.success);
  }

  void delete() {
    if (listData.isEmpty) {
      message("Data kosong, tidak ada yang bisa dihapus", MessageType.warning);
      return;
    }

    stdout.write("Masukkan nomor diagnosa yang ingin dihapus: ");
    String input = stdin.readLineSync() ?? '';

    int? index = int.tryParse(input);

    if (index == null) {
      message("Input harus berupa angka!", MessageType.error);
      return;
    }

    index -= 1;

    if (index < 0 || index >= listData.length) {
      message("Pilihan diagnosa tidak tersedia", MessageType.error);
      return;
    }

    listData.removeAt(index);

    saveAll();

    message("Diagnosa sudah terhapus", MessageType.success);
  }

  void saveAll() {
  try {
    List<Map<String, dynamic>> data =
        listData.map((e) => e.toJson()).toList();

    String jsonString = jsonEncode(data);

    _file.writeAsStringSync(jsonString);
  } catch (e) {
    print("Gagal menyimpan data: $e");
  }
}


  void loadAll() {
    if (!_file.existsSync()) return;

    String content = _file.readAsStringSync();

    if (content.isEmpty) return;

    List<dynamic> jsonList = jsonDecode(content);

    listData = jsonList.map((e) => DiagnoseData.fromJson(e)).toList();
  }
}
