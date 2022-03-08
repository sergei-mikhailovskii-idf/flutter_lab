class HomeData {
  String? registrationStep;
  String? email;
  String? phone;

  HomeData(this.registrationStep, this.email, this.phone);

  factory HomeData.init() => HomeData(null, null, null);

  HomeData copy() => HomeData(this.registrationStep, this.email, this.phone);
}
