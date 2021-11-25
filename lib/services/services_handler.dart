import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:translationchat/utils/sharedprefence.dart';


class ServicesHandler {
  String baseUrl="https://sheltered-savannah-98002.herokuapp.com/api/v1/";
  Future<dynamic> getService(
      {String? urlSuffix,
        Map<String, String>? headers,
        String? externalUrl,required bool ex,statusCode}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String userToken;
        headers ??= {
            "Content-Type": "application/json",
          };
       /* if (userToken != null) {
          headers.addAll(
              {"sessionToken": userToken, "Content-Type": "application/json"});
        }*/
        String fullUrl = "";
        if (externalUrl != null) {
          fullUrl = externalUrl;
        } else {
          fullUrl = baseUrl + urlSuffix!;
        }


        print("Full headers");
        print(headers.toString());
        final response = await http.get(Uri.parse(fullUrl),headers: headers);
        print("Get service response");
        print(json.decode(response.body.toString()));
        print("Status code ${response.statusCode}");
        if (response.statusCode == 200) {
          if(statusCode==true) {
            return 200;
          }else{
            return json.decode(utf8.decode(response.bodyBytes));
          }
          }else if(response.statusCode==202){
          if(ex==true){
           throw  json.decode(utf8.decode(response.bodyBytes));
          }else {
            return json.decode(utf8.decode(response.bodyBytes));
          }
        }
        else if (response.statusCode >= 400 && response.statusCode < 500) {
          // If that call was not successful, throw an error.
          throw Exception(response.body);
        } else {
          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {
      throw Exception(["Please check your internet connection"]);
    } catch (error) {
      print(error.toString() + 'llllllllllllllllllllllllllll');
      throw Exception(["oops! Something wrong happened!"]);
    }
  }



  Future<dynamic> postService(
      {required String urlSuffix,
      dynamic requestBody,
        Map<String, String>? headers,
        bool sendBodyAsMap = false,returnBody}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
     //   String userToken = await SharedPreferenceHandler.getToken();
        headers ??= {
            "Content-Type": "application/json",
          };



        print("Request body");
        print(requestBody);
        var finalUrl = baseUrl + urlSuffix;
        print("Request URL");
        print(finalUrl);
        final response = await http.post(Uri.parse(finalUrl),
            headers: headers,
            body:  requestBody );
        print("Response status conde ${response.statusCode}");
        print("Raw response");
        print(response.body);

        if (response.statusCode == 200) {
        if(returnBody==true){
          return json.decode(utf8.decode(response.bodyBytes));
        }else {
          return 200;
        }

        } else if (response.statusCode >= 200 && response.statusCode < 500) {
          // If that call was not successful, throw an error.

          // return json.decode(response.body);
          throw Exception(json.decode(response.body));
        } else {

          throw ({
            "errorCode": 500,
            "errorMessage": "Failed to connect to server",
            "status": "Error"
          });

//return jsonDecode(response.body);
          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {

      //  print("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      throw Exception({"errorCode": 500,
        "errorMessage": "Please check your internet connection",
        "status": "Error"});
      //  print("");

      /*    return {
        "errorCode": 600,
        "errorMessage": "Please check your internet connection",
        "status": "Error"
      };*/

    }
  }

  Future<dynamic> putService(
      {required String urlSuffix,
        dynamic requestBody,
        Map<String, String>? headers,
        bool sendBodyAsMap = false}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {


        print("Request body");
        print(requestBody);
        String finalUrl = baseUrl + urlSuffix;
        print("Request URL");
        print(finalUrl);
        final response = await http.put(Uri.parse(finalUrl),
            headers: headers,
            body: sendBodyAsMap ? requestBody : json.encode(requestBody));
        print("Response status conde ${response.statusCode}");
        print("Raw response");
        print(response.body);

        if (response.statusCode == 200) {
          return response.statusCode;
        } else if (response.statusCode >= 400 && response.statusCode < 500) {
          // If that call was not successful, throw an error.
          return response.statusCode;
          //   throw Exception(response.body);
        } else {
          throw Exception(["Failed to connect to server!"]);
        }
      }
    } on SocketException catch (error) {
      throw Exception(["Please check your internet connection"]);
    }
  }




}
