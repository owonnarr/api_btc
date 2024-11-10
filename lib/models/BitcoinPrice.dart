class BitcoinPrice {
  final double rate;

  BitcoinPrice({required this.rate});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    return BitcoinPrice(
      rate: json['bpi']['USD']['rate_float'] ?? 0.00,
    );
  }
}