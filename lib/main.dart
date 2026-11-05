import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

// ─── MAIN PAGE – Tab navigation 4 tab ───
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Modul 5 – SizedBox, Spacer & Card'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'P1: SizedBox'),
              Tab(text: 'P2: Spacer'),
              Tab(text: 'P3: Card'),
              Tab(text: 'Tugas'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Percobaan1SizedBox(),
            Percobaan2Spacer(),
            Percobaan3Card(),
            TugasMusicCard(),
          ],
        ),
      ),
    );
  }
}

// ─── PERCOBAAN 1 – SizedBox ───────────────────
// 3 kotak berwarna dalam Row:
// - SizedBox kosong (25x25) sebagai jarak antar kotak
// - SizedBox(100x100) membungkus kotak hijau → kotak membesar
class Percobaan1SizedBox extends StatelessWidget {
  const Percobaan1SizedBox({super.key});

  Container kotakUji(Color warna) {
    return Container(
      height: 75,
      width: 75,
      color: warna,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Contoh SizedBox'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kotakUji(Colors.amber),
            const SizedBox(width: 25, height: 25),
            SizedBox(
              width: 100,
              height: 100,
              child: kotakUji(Colors.green),
            ),
            const SizedBox(width: 25, height: 25),
            kotakUji(Colors.blue),
          ],
        ),
      ),
    );
  }
}

// ─── PERCOBAAN 2 – Spacer ─────────────────────
// SizedBox kosong diganti Spacer proporsional:
// - Spacer(flex: 1) antara amber dan hijau → jarak kecil
// - Spacer(flex: 2) antara hijau dan biru  → jarak 2x lebih besar
class Percobaan2Spacer extends StatelessWidget {
  const Percobaan2Spacer({super.key});

  Container kotakUji(Color warna) {
    return Container(
      height: 75,
      width: 75,
      color: warna,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Contoh Spacer'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kotakUji(Colors.amber),
            const Spacer(flex: 1),
            SizedBox(
              width: 100,
              height: 100,
              child: kotakUji(Colors.green),
            ),
            const Spacer(flex: 2),
            kotakUji(Colors.blue),
          ],
        ),
      ),
    );
  }
}

// ─── PERCOBAAN 3 – Card ───────────────────────
// Card berisi:
// - ListTile: ikon pin merah, judul lokasi, subtitle
// - Row OutlinedButton: tombol map dan phone
class Percobaan3Card extends StatelessWidget {
  const Percobaan3Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Card Demo'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                leading: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                title: Text(
                  'Taman Nasional Bromo Tengger Semeru',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Jawa Timur, Indonesia'),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Icon(Icons.map),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Icon(Icons.phone),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── TUGAS – Music Card ───────────────────────
// Sesuai spesifikasi Modul 5 (Subbab 5.4):
// - ThemeData.dark()
// - AppBar: "Sedang memutar", centerTitle: true
// - Card di Center:
//   - elevation: 4
//   - shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
//   - padding: EdgeInsets.all(12) di dalam Card
// - Isi Card:
//   - Ikon cover album
//   - Judul lagu & Nama artis
//   - Tombol like
//   - Kombinasi Card, SizedBox (jarak tetap), dan Spacer (jarak proporsional)
class TugasMusicCard extends StatelessWidget {
  const TugasMusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sedang memutar'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.album,
                    size: 150,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Judul Lagu',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Nama Artis',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
