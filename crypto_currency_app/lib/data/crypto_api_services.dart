import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoApiService {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';

  Future<Map<String, dynamic>> getCryptoData(String cryptoId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/coins/$cryptoId?localization=false&tickers=false&sparkline=true'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load crypto data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getMultipleCryptos(List<String> ids) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/coins/markets?vs_currency=usd&ids=${ids.join(",")}&sparkline=true'),
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception('Failed to load crypto data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}