import 'dart:io';

import 'package:batch28_api_starter/api/HTTPServices.dart';
import 'package:batch28_api_starter/model/Product.dart';
import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ProductAPI {
  Future<bool> addProduct(File? file, Product product) async {
    try {
      var url = baseUrl + productsUrl;
      var dio = HTTPServices().getDioInstance();
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(file.path,
            filename: file.path.split("/").last,
            contentType: MediaType("image", mimeType!.split("/")[1]));
      }

      var formData = FormData.fromMap(
        {
          "name": product.name,
          "description": product.description,
          "image": image,
          "price": product.price,
          "category": "62a0303b3de85d4458cdc96b",
          "countInStock": product.countInStock,
          "rating": product.rating,
          "numReviews": product.numReviews,
          "isFeatured": product.isFeatured
        },
      );
      var response = await dio.post(url, data: formData);
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
