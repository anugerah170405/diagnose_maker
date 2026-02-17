import 'dart:io';
import 'lib/colors_util.dart';
import 'lib/message_util.dart';

class DecisionTree {
  String? question;
  DecisionTree? nodeYes;
  DecisionTree? nodeNo;
  String? decision;

  DecisionTree({this.question, this.decision, this.nodeYes, this.nodeNo});

  bool isLeaf() => decision != null && decision!.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'decision': decision,
      'nodeYes': nodeYes?.toJson(),
      'nodeNo': nodeNo?.toJson(),
    };
  }

  factory DecisionTree.fromJson(Map<String, dynamic> json) {
    return DecisionTree(
      question: json['question'],
      decision: json['decision'],
      nodeYes: json['nodeYes'] != null
          ? DecisionTree.fromJson(json['nodeYes'])
          : null,
      nodeNo: json['nodeNo'] != null
          ? DecisionTree.fromJson(json['nodeNo'])
          : null,
    );
  }

  DecisionTree? createQuestion() {
    stdout.write(
      "${color("Apakah ini merupakan sesi terakhir", Color.cyan)} (yes/no/exit)?: ",
    );
    String ask = (stdin.readLineSync() ?? '').toLowerCase();

    if (ask == 'yes') {
      stdout.write("Masukkan hasil keputusan/kesimpulan: ");
      String decisionInput = stdin.readLineSync() ?? '';

      return DecisionTree(decision: decisionInput);
    } else if (ask == 'no') {
      stdout.write("Masukkan Pertanyaan Untuk Sesi ini: ");
      String questionInput = stdin.readLineSync() ?? '';

      DecisionTree node = DecisionTree(question: questionInput);

      message('| SESI SAAT INI: $questionInput', MessageType.info);
      message(
        "> Masukkan Pertanyaan untuk Pilihan 'Yes': ",
        MessageType.warning,
      );
      node.nodeYes = createQuestion();

      message('| SESI SAAT INI: $questionInput', MessageType.info);
      message(
        "> Masukkan Pertanyaan untuk Pilihan 'No': ",
        MessageType.warning,
      );
      node.nodeNo = createQuestion();

      return node;
    } else if (ask == 'exit') {
      return null;
    } else {
      message("Jawaban tidak valid, silakan pilih 'yes/no'", MessageType.error);
      return createQuestion();
    }
  }

  String? diagnose() {
    if (isLeaf()) {
      return decision;
    }
    ;
    stdout.write(color('$question: ', Color.blue));
    String ask = (stdin.readLineSync() ?? '').toLowerCase();
    if (ask == 'yes')
      return nodeYes!.diagnose();
    else if (ask == 'no')
      return nodeNo!.diagnose();
    else {
      message("Jawaban tidak valid, silakan pilih 'yes/no'", MessageType.error);
      return diagnose();
    }
  }
}
