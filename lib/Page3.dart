import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key, required this.title});

  final String title;

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/gpQerDBY8ak?si=-VgjUtZXoEAGHmE6";
  
  Future<void> _launchYoutube() async {
    final Uri url = Uri.parse(youtubeUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/Page4'); // Navigate to the next page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the image
            Center(
              child: Image.asset(
                'assets/images/แกงฮังเล.jpg', // Ensure the image path is correct
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the dish
            const Text(
              'แกงฮังเล เป็นอาหารพื้นเมืองภาคเหนือของไทยที่มีต้นกำเนิดจากวัฒนธรรมล้านนา เป็นแกงที่มีรสชาติกลมกล่อม เปรี้ยว หวาน เค็ม และเผ็ดเล็กน้อย มีส่วนประกอบสำคัญคือเนื้อหมูสามชั้น หรือหมูส่วนอื่นที่มีมันแทรก ต้มกับเครื่องแกงที่มีกลิ่นหอมเฉพาะตัว รวมถึงเครื่องเทศที่ช่วยเพิ่มรสชาติ เช่น ขิง หอมแดง และกระเทียมดอง\n\n'
              'วิธีทำพริกแกงฮังเล:\n'
              '- โขลกพริกกับเกลือจนละเอียด ตามด้วยกระเทียม หอมแดง ข่า ตะไคร้ และขมิ้น โขลกจนละเอียด เตรียมไว้\n\n'
              'วิธีทำแกงฮังเล:\n'
              '- นำหมูสามชั้นผสมซี่โครงหมูใส่อ่างผสม ใส่พริกแกงลงไป ตามด้วยผงฮังเล นวดให้เข้ากัน หมักไว้ประมาณ 1 ชั่วโมง\n'
              '- พอครบเวลานำหมูไปรวนในหม้อพอสุก เติมน้ำเปล่าลงไปพอท่วม\n'
              '- ปรุงรสด้วยน้ำกระเทียมดอง น้ำปลา ซีอิ๊วดำ น้ำมะขามเปียก และถั่วคั่ว เคี่ยวด้วยไฟกลางค่อนไปทางอ่อนประมาณ 1 ชั่วโมง\n'
              '- พอครบเวลาเติมน้ำตาลทราย เคี่ยวต่ออีก 2 ชั่วโมง\n'
              '- พอครบเวลาใส่กระเทียมดองกับขิงซอย คลุกเคล้าพอเข้ากัน ปิดไฟ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 50), // Space between text and buttons

            // Like and Dislike Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Like button
                IconButton(
                  icon: const Icon(Icons.thumb_up, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      likeCount++;
                    });
                  },
                ),
                Text(
                  '$likeCount Likes',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20), // Space between buttons

                // Dislike button
                IconButton(
                  icon: const Icon(Icons.thumb_down, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      dislikeCount++;
                    });
                  },
                ),
                Text(
                  '$dislikeCount Dislikes',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space between buttons and the next content

            // Center the "Home" button
            Center(
              child: ElevatedButton(
                child: const Text('Home'),
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // Navigate to the first page
                },
              ),
            ),
            
            const SizedBox(height: 20), // Space between buttons

            // YouTube Button
            Center(
              child: ElevatedButton(
                onPressed: _launchYoutube,
                child: const Text('YouTube'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
