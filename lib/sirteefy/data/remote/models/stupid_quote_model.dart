
class QuoteModel {
  Slip? slip;

  QuoteModel({
    this.slip,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    slip: json["slip"] == null ? null : Slip.fromJson(json["slip"]),
  );

  Map<String, dynamic> toJson() => {
    "slip": slip?.toJson(),
  };
}

class Slip {
  int? id;
  String? advice;

  Slip({
    this.id,
    this.advice,
  });

  factory Slip.fromJson(Map<String, dynamic> json) => Slip(
    id: json["id"],
    advice: json["advice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advice": advice,
  };
}
