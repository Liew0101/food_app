import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  _Page2State createState() => _Page2State(); // Correct state class name
}

class _Page2State extends State<Page2> {
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
              Navigator.pushNamed(context, '/Page3'); // Navigate to the next page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the image
            Center(
              child: Image.asset(
                'assets/images/ข้าวซอย.jpg', // Ensure the image exists
                width: 300,
                height: 200,
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the dish
            const Text(
               'STEP 1: ปรุงน้ำข้าวซอย\n'
  '- ตั้งหม้อหรือกระทะใบใหญ่ให้ร้อน ใส่กะทิลงไปเคี่ยวสักพัก ตามด้วยเครื่องแกง จากนั้นเคี่ยวจนกะทิให้แตกมัน\n'
  '- ใส่น่องไก่ลงไปผัดให้เข้ากับกะทิ แล้วเติมกะทิลงไปจนหมด เคี่ยวต่อให้ไก่เปื่อย สัก 30-40 นาที\n\n'
  'STEP 2: ลวกเส้น + ทอดเส้นข้าวซอย\n'
  '- ลวกเส้นข้าวซอยให้นุ่มก่อนนำไปทอดค่ะ โดยเราจะนำไปลวกในน้ำเดือด โดยใช้เวลาประมาณ 8 นาที\n'
  '- โดยแบ่งเส้นข้าวซอยที่ลวกแล้วสัก 2 หยิบมือ ผึ่งให้แห้งแล้วนำลงทอดในน้ำมันปาล์มเดือด ๆ สักพักให้กรอบ แล้วตักขึ้นพักไว้ค่ะ\n\n'
  'STEP 3: จัดเสิร์ฟ\n'
  '- ตักเส้นข้าวซอยลวกลงในชาม แล้วตักน้ำข้าวซอย พร้อมน่องไก่ราดลงไป\n'
  '- ตกแต่งด้วยข้าวซอยทอดและต้นหอมผักชีซอย ทานพร้อมพริกผัด หอมแดงซอย และผักกาดดอง',
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
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // Navigate to the home page
                },
                child: const Text('Home'),
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
