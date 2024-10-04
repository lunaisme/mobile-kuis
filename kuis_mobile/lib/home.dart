import 'package:flutter/material.dart';
import 'package:kuis_mobile/bantuan.dart';
import 'package:kuis_mobile/login.dart';
import 'daftar_barang_dummy.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.nama});
  final nama;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[600],
        title: Text('Home Page',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              icon: Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Selamat Datang, " + nama + '!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BantuanPage();
                  }));
                },
                child: Text(
                  'Butuh Bantuan? Klik untuk pergi ke halaman Panduan dan Dukungan',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: supermarketItemList.length,
                    itemBuilder: (context, index) {
                      final SupermarketItem produk = supermarketItemList[index];
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Image.network(
                              produk.imageUrls[0],
                              height: 100,
                            ),
                            Text(produk.name),
                            Text(produk.price),
                            Text(produk.stock.toString()),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
