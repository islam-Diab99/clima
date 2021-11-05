class Weather {
  late Main? main;
  Weather(
      {
        this.main,
       });

  Weather.fromJson(Map<String, dynamic> json) {

    main = json['main'] != null ? new Main.fromJson(json['main']) : null;

  }


}

class Main {
  double? temp;

  Main({this.temp,});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];

  }
}