class FlightModel {
    String? callsign;
    int? clicks;
    String? flight;
    String? flightId;
    String? fromCity;
    String? fromIata;
    String? model;
    String? squawk;
    dynamic toCity;
    dynamic toIata;
    String? type;

    FlightModel({this.callsign, this.clicks, this.flight, this.flightId, this.fromCity, this.fromIata, this.model, this.squawk, this.toCity, this.toIata, this.type});

    FlightModel.fromJson(Map<String, dynamic> json) {
        callsign = json["callsign"];
        clicks = json["clicks"];
        flight = json["flight"];
        flightId = json["flight_id"];
        fromCity = json["from_city"];
        fromIata = json["from_iata"];
        model = json["model"];
        squawk = json["squawk"];
        toCity = json["to_city"];
        toIata = json["to_iata"];
        type = json["type"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["callsign"] = callsign;
        _data["clicks"] = clicks;
        _data["flight"] = flight;
        _data["flight_id"] = flightId;
        _data["from_city"] = fromCity;
        _data["from_iata"] = fromIata;
        _data["model"] = model;
        _data["squawk"] = squawk;
        _data["to_city"] = toCity;
        _data["to_iata"] = toIata;
        _data["type"] = type;
        return _data;
    }
}