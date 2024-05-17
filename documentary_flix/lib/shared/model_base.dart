abstract class ModelBase {
  String id;

  ModelBase({required this.id});

  Map<String, dynamic> toJson();
}
