import 'package:crypto_currency_app/data/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoCard extends StatelessWidget {
  final CryptoCoin coin;
  final currencyFormat = NumberFormat.currency(symbol: '\$');

  CryptoCard({super.key, required this.coin});

  Widget _buildPriceChange(String period, double percentage) {
    final color = percentage >= 0 ? Colors.green : Colors.red;
    return Column(
      children: [
        Text(period),
        Text(
          '${percentage.toStringAsFixed(2)}%',
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coin.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  currencyFormat.format(coin.currentPrice),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Market Cap: ${currencyFormat.format(coin.marketCap)}'),
                Text('Volume: ${currencyFormat.format(coin.volume)}'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPriceChange('24h', coin.priceChangePercentage24h),
                _buildPriceChange('7d', coin.priceChangePercentage7d),
                _buildPriceChange('30d', coin.priceChangePercentage30d),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
