import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/BitcoinProvider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptoApiProvider = Provider.of<CryptoApiProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: cryptoApiProvider.isPriceLoaded
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current BTC Price:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              cryptoApiProvider.btcPrice != null
                  ? '\$${cryptoApiProvider.btcPrice!.rate.toStringAsFixed(2)}'
                  : 'No data loaded',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.orange), // Зміна фону кнопки
                textStyle: WidgetStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 28),
                ),
              ),
              onPressed: () {
                cryptoApiProvider.getBitcoinPrice();
              },
              child: const Text('Refresh data'),
            ),
          ],
        ),
      ),
    );
  }
}