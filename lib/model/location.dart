
class Location {

  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tz_id;
  final int localtime_epoch;
  final String localtime;

	Location.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		region = map["region"],
		country = map["country"],
		lat = map["lat"],
		lon = map["lon"],
		tz_id = map["tz_id"],
		localtime_epoch = map["localtime_epoch"],
		localtime = map["localtime"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['region'] = region;
		data['country'] = country;
		data['lat'] = lat;
		data['lon'] = lon;
		data['tz_id'] = tz_id;
		data['localtime_epoch'] = localtime_epoch;
		data['localtime'] = localtime;
		return data;
	}
}
