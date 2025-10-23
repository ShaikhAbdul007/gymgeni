import 'package:get_storage/get_storage.dart';

mixin class CacheManager {
  final box = GetStorage();

  //--------------------Save all the value------------------------------------------------------------------------------

  saveUserLoggedIn(bool value) {
    box.write(Key.userLoginIn.toString(), value);
  }

  saveToken(String token) {
    box.write(Key.tokenKey.toString(), token);
  }

  //----------------- Retrieve all the value------------------------------------------------------------------------------

  String retriveToken() {
    // box.writeIfNull(Key.tokenKey.toString(), '');
    return box.read(Key.tokenKey.toString()) ?? '';
  }

  Future<bool> retriveUserLoggedIn() async {
    box.writeIfNull(Key.userLoginIn.toString(), false);
    return box.read(Key.userLoginIn.toString());
  }

  //----------------- checking expire token------------------------------------------------------------------------------

  bool isTokenExpired(int expireInSeconds, DateTime loginTime) {
    DateTime expiryDateTime = loginTime.add(Duration(seconds: expireInSeconds));
    DateTime currentDateTime = DateTime.now();
    return currentDateTime.isAfter(expiryDateTime);
  }

  //----------------- Remove all the value------------------------------------------------------------------------------

  removeBox() {
    box.erase();
  }
}

enum Key {
  tokenKey,
  userLoginIn,
  userProfileResponse,
  textToogle,
  videoToggle,
  imageToggle,
  locationToggle,
}


// ----------------------- Dead code----------------------------------------------------------

// saveUserDetails(UserProfileResponse userProfileResponse) {
  //   final userDetails = userProfileResponse.toJson();
  //   box.write(Key.userProfileResponse.toString(), userDetails);
  // }

    // saveVideoToggleValue(bool value) {
  //   box.write(Key.videoToggle.toString(), value);
  // }

  // saveImageToggleValue(bool value) {
  //   box.write(Key.imageToggle.toString(), value);
  // }

  // saveLocationToggleValue(bool value) {
  //   box.write(Key.locationToggle.toString(), value);
  // }

  // saveTextToggleValue(bool value) {
  //   box.write(Key.textToogle.toString(), value);
  // }
  
  // UserProfileResponse retriveUserDetails() {
  //   final userDetails = box.read(Key.userProfileResponse.toString());
  //   if (userDetails != null) {
  //     return UserProfileResponse.fromJson(userDetails);
  //   }
  //   return UserProfileResponse();
  // }

  // Future<bool> retriveVideoToggleValue() async {
  //   box.writeIfNull(Key.videoToggle.toString(), false);
  //   return box.read(Key.videoToggle.toString());
  // }

  // Future<bool> retriveImageToggleValue() async {
  //   box.writeIfNull(Key.imageToggle.toString(), false);
  //   return box.read(Key.imageToggle.toString());
  // }

  // Future<bool> retriveLocationToggleValue() async {
  //   box.writeIfNull(Key.locationToggle.toString(), false);
  //   return box.read(Key.locationToggle.toString());
  // }

  // Future<bool> retriveTextToggleValue() async {
  //   box.writeIfNull(Key.textToogle.toString(), false);
  //   return box.read(Key.textToogle.toString());
  // }