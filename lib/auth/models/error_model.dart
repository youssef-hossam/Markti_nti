
class ErrorModel {
  int? statusCode;
  String? message;
  List<String> errors;

  ErrorModel({
    this.statusCode,
    this.message,
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    List<String> errorsList = [];
    if (json['errors'] != null) {
      json['errors'].forEach((key, value) {
        for (var error in value) {
          errorsList.add('$key : $error');
        }
      });
    }

    return ErrorModel(
      errors: errorsList,
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
