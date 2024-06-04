import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/constants/app_env.dart';

enum HTTPMethod { get, post, delete, patch, put }

// Class for configuring Dio instance
class DioService {
  DioService._internal(); // Private constructor

  static DioService? _instance; // Singleton instance variable

  // Singleton instance getter
  static DioService get instance {
    _instance ??= DioService._internal(); // Create instance if not exists
    return _instance!; // Return the instance
  }

  Dio? _dio; // Dio instance variable

  // Dio instance getter
  Dio get dio {
    // Lazy initialization of Dio instance
    _dio = _dio ??
        Dio(
          BaseOptions(
            baseUrl: APPENV.baseURl, // Base URL for requests
            connectTimeout: const Duration(seconds: 15), // Connection timeout
            receiveTimeout: const Duration(seconds: 15), // Receive timeout
          ),
        )
      ..interceptors.add(InterceptorsWrapper(
        // Add interceptors for handling requests, errors, and responses
        onRequest: (RequestOptions options, handler) {
          // Function to handle request
          return handler.next(options); // Pass request to next handler
        },
        onError: (DioException error, handler) async {
          // Function to handle error
          if (kDebugMode) {
            print("❗️======Dio error print start=====❗️");
            print("= = = Dio Error Response = = =");
            print('Error Response: ${error.response}');
            print('Error Message: ${error.message}');
            print('Error Type: ${error.type}');
            print('Error StausCode: ${error.response?.statusCode}');
            print("❗️======Dio error print end=====❗️");
          }
          return handler.next(error); // Pass error to next handler
        },
        onResponse: (Response response, handler) {
          // Function to handle response
          return handler.next(response); // Pass response to next handler
        },
      ));
    return _dio!; // Return Dio instance
  }

  _decodeToken(token) {
    final splitToken = token.split("."); // Split the token by '.'
    if (splitToken.length != 3) {
      throw const FormatException('Invalid token');
    }
    try {
      final payloadBase64 = splitToken[1]; // Payload is always the index 1
      // Base64 should be multiple of 4. Normalize the payload before decode it
      final normalizedPayload = base64.normalize(payloadBase64);
      // Decode payload, the result is a String
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      // Parse the String to a Map<String, dynamic>
      final decodedPayload = jsonDecode(payloadString);

      // Return the decoded payload
      return decodedPayload;
    } catch (error) {
      throw const FormatException('Invalid payload');
    }
  }

  bool isExpired(String token) {
    final expirationDate = _getExpirationDate(token);
    if (expirationDate == null) {
      return false;
    }
    // If the current date is after the expiration date, the token is already expired
    return DateTime.now().isAfter(expirationDate);
  }

  DateTime? _getDate({required String token, required String claim}) {
    final decodedToken = _decodeToken(token);
    final expiration = decodedToken[claim] as int?;
    if (expiration == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(expiration * 1000);
  }

  /// Returns token expiration date
  ///
  /// Throws [FormatException] if parameter is not a valid JWT token.
  DateTime? _getExpirationDate(String token) {
    return _getDate(token: token, claim: 'exp');
  }
}

// Function to make HTTP requests using Dio instance
Future<Response> makeRequest({
  required String path,
  required HTTPMethod method,
  Map<String, dynamic>? data,
}) async {
  switch (method) {
    case HTTPMethod.get:
      return DioService.instance.dio.get(
        path,
      );
    case HTTPMethod.post:
      return DioService.instance.dio.post(
        path,
        data: data,
      );
    case HTTPMethod.put:
      return DioService.instance.dio.put(
        path,
        data: data,
      );
    case HTTPMethod.delete:
      return DioService.instance.dio.delete(
        path,
        data: data,
      );
    case HTTPMethod.patch:
      return DioService.instance.dio.patch(
        path,
        data: data,
      );
    default:
      throw ArgumentError('Unsupported HTTP method: $method');
  }
}
