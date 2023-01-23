class TableColors {
  var startLight;
  var endLight;

  TableColors({this.startLight, this.endLight});

  TableColors.fromJson(dynamic json) {
    startLight = json['startLight'];
    endLight = json['endLight'];
  }

  Map<String, dynamic> toJson() => {
    'startLight': startLight?.map((v) => v.toJson()).toList(),
    'endLight': endLight?.map((v) => v.toJson()).toList(),
  };
}