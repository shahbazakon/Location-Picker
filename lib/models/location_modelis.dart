class LocationModel {
  LocationModel({
    required this.htmlAttributions,
    required this.nextPageToken,
    required this.results,
    required this.status,
  });

  final List<dynamic> htmlAttributions;
  final String? nextPageToken;
  final List<Result> results;
  final String? status;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      htmlAttributions: json["html_attributions"] == null
          ? []
          : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
      nextPageToken: json["next_page_token"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions.map((x) => x).toList(),
        "next_page_token": nextPageToken,
        "results": results.map((x) => x?.toJson()).toList(),
        "status": status,
      };

  @override
  String toString() {
    return "$htmlAttributions, $nextPageToken, $results, $status, ";
  }
}

class Result {
  Result({
    required this.businessStatus,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    required this.placeId,
    required this.plusCode,
    required this.reference,
    required this.scope,
    required this.types,
    required this.vicinity,
    required this.permanentlyClosed,
    required this.photos,
    required this.openingHours,
    required this.rating,
    required this.userRatingsTotal,
    required this.priceLevel,
  });

  final String? businessStatus;
  final Geometry? geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? name;
  final String? placeId;
  final PlusCode? plusCode;
  final String? reference;
  final String? scope;
  final List<String> types;
  final String? vicinity;
  final bool? permanentlyClosed;
  final List<Photo> photos;
  final OpeningHours? openingHours;
  final num? rating;
  final num? userRatingsTotal;
  final num? priceLevel;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      businessStatus: json["business_status"],
      geometry:
          json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
      icon: json["icon"],
      iconBackgroundColor: json["icon_background_color"],
      iconMaskBaseUri: json["icon_mask_base_uri"],
      name: json["name"],
      placeId: json["place_id"],
      plusCode: json["plus_code"] == null
          ? null
          : PlusCode.fromJson(json["plus_code"]),
      reference: json["reference"],
      scope: json["scope"],
      types: json["types"] == null
          ? []
          : List<String>.from(json["types"]!.map((x) => x)),
      vicinity: json["vicinity"],
      permanentlyClosed: json["permanently_closed"],
      photos: json["photos"] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      openingHours: json["opening_hours"] == null
          ? null
          : OpeningHours.fromJson(json["opening_hours"]),
      rating: json["rating"],
      userRatingsTotal: json["user_ratings_total"],
      priceLevel: json["price_level"],
    );
  }

  Map<String, dynamic> toJson() => {
        "business_status": businessStatus,
        "geometry": geometry?.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColor,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "place_id": placeId,
        "plus_code": plusCode?.toJson(),
        "reference": reference,
        "scope": scope,
        "types": types.map((x) => x).toList(),
        "vicinity": vicinity,
        "permanently_closed": permanentlyClosed,
        "photos": photos.map((x) => x?.toJson()).toList(),
        "opening_hours": openingHours?.toJson(),
        "rating": rating,
        "user_ratings_total": userRatingsTotal,
        "price_level": priceLevel,
      };

  @override
  String toString() {
    return "$businessStatus, $geometry, $icon, $iconBackgroundColor, $iconMaskBaseUri, $name, $placeId, $plusCode, $reference, $scope, $types, $vicinity, $permanentlyClosed, $photos, $openingHours, $rating, $userRatingsTotal, $priceLevel, ";
  }
}

class Geometry {
  Geometry({
    required this.location,
    required this.viewport,
  });

  final Location? location;
  final Viewport? viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      viewport:
          json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "viewport": viewport?.toJson(),
      };

  @override
  String toString() {
    return "$location, $viewport, ";
  }
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  final num? lat;
  final num? lng;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json["lat"],
      lng: json["lng"],
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  @override
  String toString() {
    return "$lat, $lng, ";
  }
}

class Viewport {
  Viewport({
    required this.northeast,
    required this.southwest,
  });

  final Location? northeast;
  final Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: json["northeast"] == null
          ? null
          : Location.fromJson(json["northeast"]),
      southwest: json["southwest"] == null
          ? null
          : Location.fromJson(json["southwest"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "northeast": northeast?.toJson(),
        "southwest": southwest?.toJson(),
      };

  @override
  String toString() {
    return "$northeast, $southwest, ";
  }
}

class OpeningHours {
  OpeningHours({
    required this.openNow,
  });

  final bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json["open_now"],
    );
  }

  Map<String, dynamic> toJson() => {
        "open_now": openNow,
      };

  @override
  String toString() {
    return "$openNow, ";
  }
}

class Photo {
  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  final num? height;
  final List<String> htmlAttributions;
  final String? photoReference;
  final int? width;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      height: json["height"],
      htmlAttributions: json["html_attributions"] == null
          ? []
          : List<String>.from(json["html_attributions"]!.map((x) => x)),
      photoReference: json["photo_reference"],
      width: json["width"],
    );
  }

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": htmlAttributions.map((x) => x).toList(),
        "photo_reference": photoReference,
        "width": width,
      };

  @override
  String toString() {
    return "$height, $htmlAttributions, $photoReference, $width, ";
  }
}

class PlusCode {
  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  final String? compoundCode;
  final String? globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json["compound_code"],
      globalCode: json["global_code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };

  @override
  String toString() {
    return "$compoundCode, $globalCode, ";
  }
}
