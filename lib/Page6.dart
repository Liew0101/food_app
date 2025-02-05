import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class Page6 extends StatefulWidget {
  const Page6({super.key, required this.title});

  final String title;

  @override
  _Page6State createState() => _Page6State(); // Changed state class to _Page6State
}

class _Page6State extends State<Page6> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/MkC3Kc8KTb4?si=uk5TBnY_xIRlTyDb";
  
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
              Navigator.pushNamed(context, '/Page7'); // Navigate to the next page (Page7)
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
                'assets/images/ข้าวแต๋น.jpg', // Ensure the image path is correct
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the dish
            const Text(
              'ข้าวแต๋น เป็นขนมพื้นบ้านของไทยที่มีต้นกำเนิดจากภาคเหนือ มีลักษณะเป็นข้าวพองแผ่นกลม ราดด้วยน้ำอ้อยหรือน้ำตาลเคี่ยวจนกรอบและหอม ข้าวแต๋นมักมีรสหวานกรอบ นิยมรับประทานเป็นของว่าง หรือของฝากจากภาคเหนือ\n\n'
              'วิธีทำแผ่นข้าวแต๋นน้ำแตงโม:\n\n'
              '1. ผสมเกลือกับน้ำตาลทรายลงไปในน้ำแตงโม คนผสมจนละลาย\n'
              '2. เทน้ำแตงโมลงไปในชามข้าวเหนียว คลุกเคล้าให้ทั่วใส่กะทิลงไป พักให้ข้าวดูดน้ำประมาณ 2-3 นาที\n'
              '3. จากนั้นใส่งาดำลงไป\n'
              '4. นำพิมพ์จุ่มน้ำ ตักข้าวเหนียวใส่ลงไป กดให้เสมอกัน ไม่ต้องกดแน่นมากนะคะ แค่พอจับตัวกันไม่หลุดค่ะ\n'
              '5. นำไปตากแดดประมาณ 1 วัน พอแห้งดีแล้วนำไปทอดด้วยไฟแรง\n'
              '6. พอข้าวแต๋นพองสุกเหลืองแล้วรีบตักขึ้น พักให้สะเด็ดน้ำมัน\n\n'
              'วิธีทำน้ำตาลราดข้าวแต๋น:\n\n'
              '1. ใส่น้ำตาลมะพร้าวลงไปในหม้อ ตามด้วยน้ำตาลทรายแดงกับเกลือป่น เติมน้ำลงไปเล็กน้อย\n'
              '2. ต้มด้วยไฟอ่อนจนน้ำตาลละลาย\n\n'
              'วิธีทำข้าวแต๋นน้ำแตงโม:\n\n'
              '1. ตักน้ำตาลราดบนขนม',
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
