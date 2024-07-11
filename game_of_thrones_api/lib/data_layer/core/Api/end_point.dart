class EndPoint {
  static String baseUrl = "https://thronesapi.com/api/v2/";
  static String baseUrl2 = "https://food-api-omega.vercel.app/api/v1/";
  static String characters = "Characters";
  static String signUp = "user/signup";
  static String logout = "user/logout";
  static String update = "user/update";
   static String signIn = "user/signin";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }

  static String DeleteUserEndPoint(id) {
    return "user/delete/";
  }
}

class ApiKey {
  static String status = "status";
  static String errors = "errors";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
