import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String title;

  const Page1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 170),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.room_service, color: Colors.black), // เพิ่มไอคอนเมนู
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('เมนูถูกกด')),
            );
          },
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('อาหาร', screenWidth),
              const SizedBox(height: 16),
              _buildGridView(
                context,
                items: [
                  _FoodItem('assets/images/ข้าวซอย.jpg', 'ข้าวซอย', '/Page2'),
                  _FoodItem('assets/images/แกงฮังเล.jpg', 'แกงฮังเล', '/Page3'),
                  _FoodItem('assets/images/น้ำพริกหนุ่ม.jpg', 'น้ำพริกหนุ่ม', '/Page4'),
                  _FoodItem('assets/images/ไส้อั่ว.jpg', 'ไส้อั่ว', '/Page5'),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('ของว่าง', screenWidth),
              const SizedBox(height: 16),
              _buildGridView(
                context,
                items: [
                  _FoodItem('assets/images/ข้าวแต๋น.jpg', 'ข้าวแต๋น', '/Page6'),
                  _FoodItem('assets/images/ข้าวโพดอบเนย.jpg', 'ข้าวโพดอบเนย', '/Page7'),
                  _FoodItem('assets/images/ซาลาเปาไส้ครีม.jpg', 'ซาลาเปาไส้ครีม', '/Page8'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Text(
      title,
      style: TextStyle(
        fontSize: screenWidth * 0.06,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
    );
  }

  Widget _buildGridView(BuildContext context, {required List<_FoodItem> items}) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return _buildFoodCard(context, items[index]);
      },
    );
  }

  Widget _buildFoodCard(BuildContext context, _FoodItem item) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, item.pageRoute),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                item.imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    item.foodName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.dining_outlined, color: Colors.red, size: 16),
                      SizedBox(width: 4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodItem {
  final String imagePath;
  final String foodName;
  final String pageRoute;

  const _FoodItem(this.imagePath, this.foodName, this.pageRoute);
}