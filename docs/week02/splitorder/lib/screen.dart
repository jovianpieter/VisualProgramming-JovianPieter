import 'package:flutter/material.dart';

class SplitBillScreen extends StatefulWidget {
  const SplitBillScreen({super.key});

  @override
  State<SplitBillScreen> createState() => _SplitBillScreenState();
}

class _SplitBillScreenState extends State<SplitBillScreen> {
  final TextEditingController _namaMenuController = TextEditingController();
  final TextEditingController _hargaMenuController = TextEditingController();

  final List<Map<String, String>> _daftarMenu = [];

  void _tambahMenu() {
    if (_namaMenuController.text.isNotEmpty && _hargaMenuController.text.isNotEmpty) {
      setState(() {
        _daftarMenu.add({
          'nama': _namaMenuController.text,
          'harga': _hargaMenuController.text,
        });
        _namaMenuController.clear();
        _hargaMenuController.clear();
      });
    }
  }

  void _add500Menus() {
    setState(() {
      for (int i = 0; i < 500; i++) {
        _daftarMenu.add({
          'nama': 'Menu Uji Coba ke-${i + 1}',
          'harga': '15000',
        });
      }
    });
  }

  @override
  void dispose() {
    _namaMenuController.dispose();
    _hargaMenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplitOrder Kalkulator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bug_report),
            tooltip: 'Tes 500 Item',
            onPressed: _add500Menus,
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return _buildWideLayout();
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }

  Widget _buildNarrowLayout() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FriendInputSection(),
                const SizedBox(height: 24),
                MenuInputSection(
                  nameController: _namaMenuController,
                  priceController: _hargaMenuController,
                  onAdd: _tambahMenu,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        _buildSliverDaftarMenu(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                SizedBox(height: 16),
                TaxDiscountSection(),
                SizedBox(height: 24),
                Center(child: ReceiptSummary()),
                SizedBox(height: 24),
                ShareButton(),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FriendInputSection(),
                      const SizedBox(height: 24),
                      MenuInputSection(
                        nameController: _namaMenuController,
                        priceController: _hargaMenuController,
                        onAdd: _tambahMenu,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              _buildSliverDaftarMenu(isTablet: true),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: const [
                      SizedBox(height: 16),
                      TaxDiscountSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: const [
                SizedBox(height: 48),
                ReceiptSummary(),
                SizedBox(height: 48),
                ShareButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSliverDaftarMenu({bool isTablet = false}) {
    final double paddingHorizontal = isTablet ? 24.0 : 16.0;
    if (_daftarMenu.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 8.0),
          child: const Center(
            child: Text(
              'Belum ada menu yang ditambahkan',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      );
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final menu = _daftarMenu[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(
                menu['nama']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('Rp ${menu['harga']}'),
            );
          },
          childCount: _daftarMenu.length,
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
            const Expanded(child: TextField(decoration: InputDecoration(hintText: 'Ketik nama teman...'))),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Tambah')),
          ],
        ),
      ],
    );
  }
}

class MenuInputSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final VoidCallback onAdd;

  const MenuInputSection({super.key, required this.nameController, required this.priceController, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('2. Masukkan Menu & Harga'),
        Row(
          children: [
            Expanded(flex: 2, child: TextField(controller: nameController, decoration: const InputDecoration(hintText: 'Nama Menu'))),
            const SizedBox(width: 16),
            Expanded(flex: 1, child: TextField(controller: priceController, keyboardType: TextInputType.number, decoration: const InputDecoration(hintText: 'Harga'))),
            IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
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
        Expanded(child: TextField(keyboardType: TextInputType.number, decoration: InputDecoration(hintText: 'Pajak (%)'))),
        SizedBox(width: 16),
        Expanded(child: TextField(keyboardType: TextInputType.number, decoration: InputDecoration(hintText: 'Diskon (Rp)'))),
      ],
    );
  }
}

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Total Transaksi'),
        const SizedBox(height: 8),
        Text('Rp 0', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Bagikan Tagihan')));
  }
}