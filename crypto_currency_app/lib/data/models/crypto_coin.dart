class CryptoCoin {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final double marketCap;
  final double volume;
  final double priceChangePercentage24h;
  final double priceChangePercentage7d;
  final double priceChangePercentage30d;

  CryptoCoin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.marketCap,
    required this.volume,
    required this.priceChangePercentage24h,
    required this.priceChangePercentage7d,
    required this.priceChangePercentage30d,
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      currentPrice: json['current_price']?.toDouble() ?? 0.0,
      marketCap: json['market_cap']?.toDouble() ?? 0.0,
      volume: json['total_volume']?.toDouble() ?? 0.0,
      priceChangePercentage24h: json['price_change_percentage_24h']?.toDouble() ?? 0.0,
      priceChangePercentage7d: json['price_change_percentage_7d']?.toDouble() ?? 0.0,
      priceChangePercentage30d: json['price_change_percentage_30d']?.toDouble() ?? 0.0,
    );
  }
}