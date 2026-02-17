import '../decisionTree.dart';

class DiagnoseData {
  final String title;
  final DecisionTree? tree;

  DiagnoseData({
    required this.title,
    required this.tree,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'tree': tree?.toJson(),
      };

  factory DiagnoseData.fromJson(Map<String, dynamic> json) {
    return DiagnoseData(
      title: json['title'],
      tree: DecisionTree.fromJson(json['tree']),
    );
  }
}
