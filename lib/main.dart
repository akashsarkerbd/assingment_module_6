import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'assignment 6',
      home:  HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen ({super.key});
  static const List<String>imageUrls = [
    'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdXB3azYyMTc4MDU2LXdpa2ltZWRpYS1pbWFnZS1rb3duZGN5ai5qcGc.jpg',
    'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcGQxMDYtMDY2Yl8xLmpwZw.jpg',
    'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcHg5MTEwMzUtaW1hZ2Uta3d5bzJvanouanBn.jpg',
    'https://images.rawpixel.com/image_800/cHJpdmF0ZS9zdGF0aWMvaW1hZ2Uvd2Vic2l0ZS8yMDIyLTA0L2xyL2ZybGlvbl9iaWdfY2F0X2JpZ18wLWltYWdlLWt5YmQ3bHhvLmpwZw.jpg',
    'https://images.rawpixel.com/image_800/cHJpdmF0ZS9zdGF0aWMvaW1hZ2Uvd2Vic2l0ZS8yMDIyLTA0L2xyL3B4OTE3NDYyLWltYWdlLWt3eW8ydmxrLmpwZw.jpg',
    'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGQxOS0zLTQ4OTM1NmEuanBn.jpg',
     ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Photo Gallery'),
        centerTitle: true,
      ),

    body: SingleChildScrollView(
    padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Welcome to our Photo Gallery!',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    TextField(
    decoration: InputDecoration(
    labelText: 'Search for photo',
      border: OutlineInputBorder(),
    ),
    ),
            SizedBox(
              child: Padding(
                padding:  EdgeInsets.all(10.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: imageUrls.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      footer: Container(color: Colors.white,child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Center(child: Text("Photo $index",style:TextStyle(fontSize: 12),)),
                      ),),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Image $index  this image are click'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150,
                          color: Colors.white,
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemBuilder:  (context, index2) =>  ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage(imageUrls[index2]),),
                  title: Text('Photo ${index2+1}'),
                  subtitle: Text('Description of photo ${index2+1}'),
                ),
              ),
            ),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                child: Icon(Icons.upload),
              ),
            ),
          ],
        ),
      ),
    );
  }
}