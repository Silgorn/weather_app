class Constants {
  static const String appName = 'Weather App';

  // Icons
  static const thermometerIcon = 'assets/meteo_icons/thermometer.png';
  static const humidityIcon = 'assets/meteo_icons/rainy.png';
  static const windIcon = 'assets/meteo_icons/wind.png';

  // Api
  static const String weatherAppId = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const String weatherBaseScheme = 'https://';
  static const String weatherBaseUrlDomain = 'api.openweathermap.org';
  static const String weatherForecastPath = '/data/2.5/forecast/daily';
  static const String weatherImagesPath = '/img/w/';
  static const String weatherImagesUrl =
      weatherBaseScheme + weatherBaseUrlDomain + weatherImagesPath;
}
