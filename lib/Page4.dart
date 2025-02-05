import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class Page4 extends StatefulWidget {
  const Page4({super.key, required this.title});

  final String title;

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/WKhiBs2QjyA?si=byvc6QcqeX-NGrTt";
  
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
              Navigator.pushNamed(context, '/Page5'); // Navigate to the next page (Page5)
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
                'assets/images/น้ำพริกหนุ่ม.jpg', // Ensure the image path is correct
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the dish
            const Text(
              'น้ำพริกหนุ่ม เป็นน้ำพริกพื้นบ้านของภาคเหนือของไทย มีรสชาติหอมจากพริกย่าง รสเผ็ดอ่อนๆ และมีกลิ่นหอมเฉพาะตัว นิยมรับประทานคู่กับผักสด ผักลวก หรืออาหารพื้นเมือง เช่น ไส้อั่ว แคบหมู และข้าวเหนียว\n\n'
              'วิธีทำ:\n\n'
              'STEP 1: ย่างส่วนผสม\n'
              '- นำพริกหนุ่ม หอมแดง และกระเทียมย่างบนเตาเลยค่ะ เพื่อให้มีกลิ่นหอม\n'
              '- เมื่อย่างได้ที่แล้วพักไว้ให้เย็น นำมาปอกเปลือกออกให้หมดค่ะ\n\n'
              'STEP 2: โขลกน้ำพริก\n'
              '- นำพริกหนุ่ม หอมแดง และกระเทียมที่ปอกเปลือกเรียบร้อยแล้ว นำมาโขลกให้เป็นเนื้อเดียวกัน\n\n'
              'STEP 3: ปรุงรสและจัดเสิร์ฟ\n'
              '- เมื่อโขลกส่วนผสมจนเข้าที่แล้ว ทำการปรุงรสด้วย น้ำตาล น้ำปลา และเกลือ โขลกต่อให้เครื่องปรุงรสเข้ากันดีค่ะ\n'
              '- เมื่อส่วนผสมทุกอย่างเข้ากันดีแล้ว ตักขึ้นเสิร์ฟพร้อมแคปหมู เครื่องเคียง ผักตามชอบได้เลยค่ะ',
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
