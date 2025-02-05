import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class Page7 extends StatefulWidget {
  const Page7({super.key, required this.title});

  final String title;

  @override
  _Page7State createState() => _Page7State(); // Corrected state class name
}

class _Page7State extends State<Page7> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/t30uMqG6VWM?si=kOJ8GxcYZz1nxK7y";
  
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
              Navigator.pushNamed(context, '/Page8'); // Navigate to the next page (Page8)
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
                'assets/images/ข้าวโพดอบเนย.jpg', // Ensure the image path is correct
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the dish
            const Text(
              'ข้าวโพดอบเนย เป็นอาหารว่างที่ได้รับความนิยมอย่างมาก ด้วยรสชาติหอมหวานของข้าวโพดที่เคล้ากับเนยและน้ำตาล หรือบางครั้งอาจเพิ่มรสชาติด้วยการใส่นมข้นหวาน เหมาะสำหรับรับประทานเล่นในทุกโอกาส\n\n'
              'วิธีทำ ข้าวโพดอบเนย:\n\n'
              '1. เตรียมข้าวโพดหวานต้มสุก โดยแกะข้าวโพดหวานที่ต้มสุกแล้วเป็นเม็ด ๆ หรือจะฝานก็ได้ ตามชอบ เตรียมไว้\n'
              '2. ตักข้าวโพดหวานที่แกะเตรียมไว้ ใส่ชามผสม\n'
              '3. ใส่เนย คลุกจนเนยละลายเคลือบเม็ดข้าวโพด\n'
              '4. จากนั้น ใส่น้ำตาลทราย นมข้นจืด  และเกลือ นิดหน่อย เพื่อตัดเลี่ยน หากชอบหวาน สามารถเติมน้ำตาลเพิ่มได้ คลุกจนทุกอย่างเข้ากันดี\n'
              'เคล็ดลับ : ในระหว่างการคลุก ข้าวโพด ต้องมีความร้อนอยู่เสมอ เพื่อให้ส่วนผสมทุกอย่างละลาย\n'
              '5. จากนั้น ตักข้าวโพดคลุกเนย ใส่ถ้วย พร้อมเสิร์ฟ',
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

            // Center the "Open Page 1" button
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
