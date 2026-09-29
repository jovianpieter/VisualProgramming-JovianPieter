import 'package:flutter/material.dart';

class SplitBillScreen extends StatelessWidget {
  const SplitBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplitOrder Kalkulator'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FriendInputSection(),
            SizedBox(height: 24),
            MenuInputSection(),
            SizedBox(height: 24),
            TaxDiscountSection(),
            SizedBox(height: 48),
            Center(child: ReceiptSummary()),
            SizedBox(height: 48),
            ShareButton(),
          ],
        ),
      ),
    );
  }
}

class FriendInputSection extends StatelessWidget {
  const FriendInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('1. Siapa yang makan?'),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: 'Ketik nama teman...'),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tambah'),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuInputSection extends StatelessWidget {
  const MenuInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('2. Masukkan Menu & Harga'),
        Row(
          children: [
            const Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(hintText: 'Nama Menu'),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Harga'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class TaxDiscountSection extends StatelessWidget {
  const TaxDiscountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Pajak (%)'),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Diskon (Rp)'),
          ),
        ),
      ],
    );
  }
}

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Total Transaksi'),
        SizedBox(height: 8),
        Text(
          'Rp 0',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Bagikan Tagihan'),
      ),
    );
  }
}