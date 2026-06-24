import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class StudentData {
  final String id;
  final String firstName;
  final String lastName;
  final String course;
  final int score;
  final String createdAt;
  final String updatedAt;

  StudentData(
    this.id,
    this.firstName,
    this.lastName,
    this.course,
    this.score,
    this.createdAt,
    this.updatedAt,
  );

  StudentData.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      firstName = json['first_name'],
      lastName = json['last_name'],
      course = json['course'],
      score = json['score'],
      createdAt = json['created_at'],
      updatedAt = json['updated_at'];
}

class HttpClient {
  static Dio instance = Dio(
    BaseOptions(baseUrl: 'https://6a3be476e4a07f202e1622f3.mockapi.io/api/v1/'),
  );
}

Future<List<StudentData>> getStudents() async {
  final response = await HttpClient.instance.get('students');
  debugPrint('Response: ${response.data}');
  final List<StudentData> students = [];
  if (response.data is List<dynamic>) {
    for (var element in (response.data as List<dynamic>)) {
      students.add(StudentData.fromJson(element));
    }
  }
  return students;
}

Future<StudentData> addStudent(
  String firstName,
  String lastName,
  String course,
  int score,
) async {
  final response = await HttpClient.instance.post(
    'students',
    data: {
      "first_name": firstName,
      "last_name": lastName,
      "course": course,
      "score": score,
      "created_at": "Created Student",
      "updated_at": "Updated Student",
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return StudentData.fromJson(response.data);
  } else {
    throw Exception(response.statusMessage);
  }
}
