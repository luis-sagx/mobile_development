class SatelliteResponse {
  final Signature? signature;
  final String? count;
  final List<SatelliteData>? data;

  SatelliteResponse({this.signature, this.count, this.data});

  factory SatelliteResponse.fromJson(Map<String, dynamic> json) {
    return SatelliteResponse(
      signature: json['signature'] != null
          ? Signature.fromJson(json['signature'])
          : null,
      count: json['count'],
      data: json['data'] != null
          ? (json['data'] as List)
                .map((e) => SatelliteData.fromJson(e))
                .toList()
          : null,
    );
  }
}

class Signature {
  final String? source;
  final String? version;

  Signature({this.source, this.version});

  factory Signature.fromJson(Map<String, dynamic> json) {
    return Signature(source: json['source'], version: json['version']);
  }
}

class SatelliteData {
  final Satellite? sat;

  SatelliteData({this.sat});

  factory SatelliteData.fromJson(Map<String, dynamic> json) {
    return SatelliteData(
      sat: json['sat'] != null ? Satellite.fromJson(json['sat']) : null,
    );
  }
}

class Satellite {
  final String? satClass;
  final String? iauName;
  final String? iauNum;
  final String? kind;
  final String? notes;
  final String? pdes;
  final String? prefix;
  final String? provNum;
  final dynamic provYear; // Can be String or int in JSON
  final String? ref;
  final String? satFullname;

  Satellite({
    this.satClass,
    this.iauName,
    this.iauNum,
    this.kind,
    this.notes,
    this.pdes,
    this.prefix,
    this.provNum,
    this.provYear,
    this.ref,
    this.satFullname,
  });

  factory Satellite.fromJson(Map<String, dynamic> json) {
    return Satellite(
      satClass: json['class'],
      iauName: json['iau_name'],
      iauNum: json['iau_num']?.toString(),
      kind: json['kind'],
      notes: json['notes'],
      pdes: json['pdes'],
      prefix: json['prefix'],
      provNum: json['prov_num']?.toString(),
      provYear: json['prov_year'],
      ref: json['ref'],
      satFullname: json['sat_fullname'],
    );
  }
}
