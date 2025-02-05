import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page8 extends StatefulWidget {
  const Page8({super.key, required this.title});

  final String title;

  @override
  _Page8State createState() => _Page8State(); // Correct state class name
}

class _Page8State extends State<Page8> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/ui6UXoW5mxU?si=993uc0WMlgbdngn_";
  
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the image
            Center(
              child: Image.asset(
                'assets/images/ซาลาเปาไส้ครีม.jpg', // Make sure the image exists
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text

            // Text describing the dish
            const Text(
              'ซาลาเปาไส้ครีมเป็นขนมหวานที่มีแป้งนุ่มๆ ห่อไส้ครีมหวาน ซึ่งเป็นที่นิยมในหลายประเทศ โดยเฉพาะในจีนและประเทศไทย โดยทั่วไปซาลาเปาไส้ครีมจะมีลักษณะของแป้งที่นุ่มและฟูเหมือนกับซาลาเปาทั่วไป แต่ภายในจะมีไส้ครีมที่มีความหวานและนุ่ม มักจะมีรสครีมจากไข่และนม หรือบางครั้งอาจใส่กลิ่นวนิลาและเนยลงไปซาลาเปาไส้ครีมมีหลายสูตรและสามารถทำได้ง่ายๆ โดยใช้แป้งซาลาเปาหรือแป้งขนมปังที่ผสมยีสต์และนมสด ส่วนไส้ครีมก็ทำจากไข่แดง น้ำตาล นมข้นหวาน และแป้งข้าวโพดเพื่อให้ครีมข้นหนึบ เมื่อทำเสร็จแล้ว ซาลาเปาจะถูกนึ่งจนแป้งฟูและไส้ครีมภายในจะร้อนและหวานอร่อย\n\n'
              'วิธีทำซาลาเปา:\n\n'
              '1. เริ่มด้วยการทำไส้ครีมคัสตาร์ดกันก่อน เพราะจะต้องทำให้ไส้เย็นก่อนจะนำมาประกอบในซาลาเปา\n'
              '2. ตอกไข่ใส่อ่างผสม 4 ฟอง ตีให้เข้ากัน จากนั้นเติมน้ำตาลทราย คนด้วยตะกร้อมือให้น้ำตาลละลาย\n'
              '3. ใส่แป้งข้าวโพด แป้งสาลีอเนกประสงค์ ผงคัสตาร์ด และนมผง จากนั้นคนต่อให้เข้ากันดี\n'
              '4. เติมกลิ่นวานิลลาแบบน้ำ แล้วคนให้เข้ากันดี\n'
              '5. นำมาใส่กระชอนกรองให้เนื้อไข่และเศษของแป้งแยกจากกัน\n'
              '6. นำไปตุ๋น โดยต้มน้ำเดือดในหม้อและวางภาชนะที่มีครีมบนหม้อเดือด กวนจนข้น\n'
              '7. กวนเสร็จแล้วให้เทใส่ถ้วย ปิดพลาสติกและพักให้เย็นในตู้เย็น\n\n'
              'ขั้นตอนทำแป้งซาลาเปา:\n\n'
              '1. ทำแป้งเชื้อโดยผสมน้ำอุ่น น้ำตาลทราย และยีสต์พักไว้ 5 นาที\n'
              '2. นำแป้งตราบัวแดงมาใส่อ่างและร่อนแป้งให้ละเอียด จากนั้นผสมกับยีสต์ที่พักไว้\n'
              '3. นวดแป้งประมาณ 20-30 นาทีให้เนียนดี\n'
              '4. พักแป้งในที่อบอุ่น 1 ชั่วโมงจนแป้งขึ้นฟู\n'
              '5. ผสมแป้งเชื้อกับแป้งซาลาเปาส่วนที่ 2 นวดให้เข้ากันจนเนื้อเนียน\n'
              '6. ตัดแบ่งแป้งเป็นก้อนขนาดประมาณ 30 กรัม\n'
              '7. คลึงแป้งเป็นก้อนกลมและพักไว้ 15 นาที\n\n'
              'ขั้นตอนการนึ่งซาลาเปา:\n\n'
              '1. ใส่ไส้ครีมคัสตาร์ดในแป้งซาลาเปาแล้วปิดให้มิด\n'
              '2. นำซาลาเปาไปนึ่งในซึ้ง 20 นาทีจนสุก\n'
              '3. เสร็จแล้วสามารถนำออกจากซึ้งและวางให้เย็น',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20), // Space between text and buttons

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
            const SizedBox(height: 50), // Space between buttons and the next content

            // Center the "Open Page 1" button
            Center(
              child: ElevatedButton(
                child: const Text('Home'),
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // Navigate back to the first page
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
