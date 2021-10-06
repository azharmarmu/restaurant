class ItemModel {
  final List<dynamic> htmlAttributions;
  final String? nextPageToken;
  final List<Results> results;

  const ItemModel({
    required this.htmlAttributions,
    required this.nextPageToken,
    required this.results,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    var _htmlList = List<dynamic>.empty(growable: true);
    if (json['html_attributions'] != null) {
      json['html_attributions'].forEach((v) {
        _htmlList.add(v);
      });
    }
    var _resultList = List<Results>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        _resultList.add(Results.fromJson(v));
      });
    }

    return ItemModel(
      htmlAttributions: _htmlList,
      nextPageToken: json['next_page_token'] ?? null,
      results: _resultList,
    );
  }
}

class Results {
  final String businessStatus;
  final Geometry geometry;
  final String icon;
  final String name;
  final OpeningHours? openingHours;
  final List<Photos> photos;
  final String placeId;
  final PlusCode plusCode;
  final double rating;
  final String reference;
  final String scope;
  final List<String> types;
  final int userRatingsTotal;
  final String vicinity;

  const Results({
    required this.businessStatus,
    required this.geometry,
    required this.icon,
    required this.name,
    required this.openingHours,
    required this.photos,
    required this.placeId,
    required this.plusCode,
    required this.rating,
    required this.reference,
    required this.scope,
    required this.types,
    required this.userRatingsTotal,
    required this.vicinity,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    var _photoList = List<Photos>.empty(growable: true);
    if (json['photos'] != null) {
      json['photos'].forEach((v) {
        _photoList.add(Photos.fromJson(v));
      });
    }

    var _typesList = List<String>.empty(growable: true);
    if (json['types'] != null) {
      json['types'].forEach((dynamic v) {
        _typesList.add(v[0].toUpperCase() + v.substring(1));
      });
    }

    return Results(
      businessStatus: json['business_status'],
      geometry: Geometry.fromJson(json['geometry']),
      icon: json['icon'],
      name: json['name'],
      openingHours: json['opening_hours'] != null
          ? OpeningHours.fromJson(json['opening_hours'])
          : null,
      photos: _photoList,
      placeId: json['place_id'],
      plusCode: PlusCode.fromJson(json['plus_code']),
      rating: double.parse(json['rating'].toString()),
      reference: json['reference'],
      scope: json['scope'],
      types: _typesList,
      userRatingsTotal: json['user_ratings_total'],
      vicinity: json['vicinity'],
    );
  }
}

class Geometry {
  final Location location;
  final Viewport viewport;

  const Geometry({required this.location, required this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location']),
      viewport: Viewport.fromJson(json['viewport']),
    );
  }
}

class Location {
  final double lat;
  final double lng;

  const Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat'], lng: json['lng']);
  }
}

class Viewport {
  final Location northeast;
  final Location southwest;

  const Viewport({required this.northeast, required this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: Location.fromJson(json['northeast']),
      southwest: Location.fromJson(json['southwest']),
    );
  }
}

class OpeningHours {
  final bool openNow;

  const OpeningHours({required this.openNow});

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(openNow: json['open_now']);
  }
}

class Photos {
  final int height;
  final List<String> htmlAttributions;
  final String photoReference;
  final int width;

  const Photos({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      height: json['height'],
      htmlAttributions: json['html_attributions'].cast<String>(),
      photoReference: json['photo_reference'],
      width: json['width'],
    );
  }
}

class PlusCode {
  final String compoundCode;
  final String globalCode;

  const PlusCode({required this.compoundCode, required this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }
}
