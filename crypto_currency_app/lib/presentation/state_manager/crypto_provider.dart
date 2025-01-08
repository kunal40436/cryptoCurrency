import 'package:crypto_currency_app/data/crypto_api_services.dart';
import 'package:crypto_currency_app/data/models/crypto_coin.dart';
import 'package:flutter/foundation.dart';

class CryptoProvider with ChangeNotifier {
  final CryptoApiService _apiService = CryptoApiService();
  List<CryptoCoin> _coins = [];
  bool _isLoading = false;
  String? _error;

  List<CryptoCoin> get coins => _coins;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCryptos(List<String> ids) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final data = await _apiService.getMultipleCryptos(ids);
      _coins = data.map((json) => CryptoCoin.fromJson(json)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}