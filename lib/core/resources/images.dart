class AppImages {
  static final AppImages _singleton = AppImages._internal();

  factory AppImages() {
    return _singleton;
  }

  AppImages._internal();

  static const _kPath = 'assets/images';

  static const background = '$_kPath/background.jpg';
  static const search = '$_kPath/search.png';
}
