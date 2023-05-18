import 'dart:convert';

class OtherModel {
  final String? id;
  final String? typeString;
  OtherModel({
    this.id,
    this.typeString,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'typeString': typeString,
    };
  }

  factory OtherModel.fromMap(Map<String, dynamic> map) {
    return OtherModel(
      id: map['id'] != null ? map['id'] as String : null,
      typeString:
          map['typeString'] != null ? map['typeString'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherModel.fromJson(String source) =>
      OtherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  OtherModel copyWith({
    String? id,
    String? typeString,
  }) {
    return OtherModel(
      id: id ?? this.id,
      typeString: typeString ?? this.typeString,
    );
  }

  @override
  String toString() => 'OtherModel(id: $id, typeString: $typeString)';

  @override
  bool operator ==(covariant OtherModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.typeString == typeString;
  }

  @override
  int get hashCode => id.hashCode ^ typeString.hashCode;
}
