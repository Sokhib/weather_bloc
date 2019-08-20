
class Condition {

  final String text;
  final String icon;
  final int code;

	Condition.fromJsonMap(Map<String, dynamic> map): 
		text = map["text"],
		icon = map["icon"],
		code = map["code"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = text;
		data['icon'] = icon;
		data['code'] = code;
		return data;
	}
}
