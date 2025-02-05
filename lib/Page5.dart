import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class Page5 extends StatefulWidget {
  const Page5({super.key, required this.title});

  final String title;

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/1PQSA8G8DrE?si=Vpk092DzWpU0aBD4";
  
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
              Navigator.pushNamed(context, '/Page6'); // Navigate to the next page (Page6)
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
                'assets/images/ไส้อั่ว.jpg', // Ensure the image path is correct
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the dish
            const Text(
              'ไส้อั่ว เป็นอาหารพื้นเมืองที่มีชื่อเสียงของภาคเหนือของไทย มีลักษณะคล้ายไส้กรอก แต่ปรุงด้วยสมุนไพรและเครื่องเทศพื้นบ้านที่เข้มข้น รสชาติหอมกลิ่นสมุนไพรและมีรสเผ็ดกลมกล่อม นิยมรับประทานคู่กับข้าวเหนียว น้ำพริกหนุ่ม หรือผักสด\n\n'
              'วิธีทำไส้อั่ว:\n\n'
              '1. นำหมูบดมาใส่อ่างผสมใหญ่หน่อยนะคะ เติมพริกแกงแดง หรือน้ำพริกสำหรับทำไส้อั่ว (ดูวิธีทำในวิดีโอน้ำพริกไส้อั่ว)\n'
              '2. ใส่น้ำพริก น้ำตาลทราย และผงขมิ้น ลงในอ่างผสมปรุงรสด้วยซีอิ๊วขาว น้ำปลา และน้ำมันหอย แล้วคลุก ๆ นวด ๆ ให้เข้ากัน\n'
              '3. เมื่อคลุก ๆ นวด ๆ เข้ากันแล้ว ให้นำส่วนผสมไปใส่ไมโครเวฟนิดหน่อย ประมาณ 1 ช้อนชาแล้วชิมดูว่ารสชาติถูกใจหรือยัง\n'
              '4. ถ้าถูกใจให้ใส่ใบมะกรูดซอย และต้นหอมผักชีซอยลงคลุก ๆ นวด ๆ ให้เข้ากันอีกครั้ง\n'
              '5. นำไส้มาล้างผ่านน้ำก๊อกให้สะอาด เตรียมไว้\n'
              '6. ถ้าใครไม่มีเครื่อง ก็ใช้ขวดน้ำพลาสติกตัดแบ่งครึ่งแล้วนำไส้มายัดได้นะคะ แต่ใช้เวลาหน่อย ใครมีเครื่องก็สะดวก\n'
              '7. เวลายัดไส้ก็หาเข็มหรือไม้แหลมมาคอยจิ้มด้วยนะคะ เพราะว่าจะมีอากาศเข้าทำให้ไส้พองค่ะ\n'
              '8. เมื่อยัดจนหมดแล้วก็จัดการนำไปย่าง หรือนำไปอบ หรือทอดให้สุก ไส้อั่วก็เสร็จเตรียมพร้อมกินได้เลยค่ะ',
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
