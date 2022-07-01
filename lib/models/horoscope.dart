class Horoscope{

  final String horoscopeName;
  final String horoscopeDateScope;
  final String horoscopeGeneralProperties;
  final String horoscopeLittlePicture;
  final String horoscopeBigPicture;

  Horoscope(this.horoscopeName, this.horoscopeDateScope, this.horoscopeGeneralProperties, this.horoscopeLittlePicture, this.horoscopeBigPicture);

  @override
  String toString() {
    // TODO: implement toString
    return "$horoscopeName";
  }


}