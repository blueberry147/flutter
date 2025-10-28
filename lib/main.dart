import 'package:flutter/material.dart';
import 'package:my_web/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'LEARN FLUTTER';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color.fromARGB(255, 225, 252, 215), // 👈 پس‌زمینه تمام صفحات
      ),
      home: const Login(),
      // home: Scaffold(
      //   appBar: AppBar(title: const Text(appTitle)),
      //   body: Container(
      //     margin: const EdgeInsets.all(16), // فاصله از اطراف صفحه
      //     decoration: BoxDecoration(
      //       border: Border.all(
      //         color: Colors.green, // رنگ حاشیه
      //         width: 3, // ضخامت حاشیه
      //       ),
      //       borderRadius: BorderRadius.circular(12), // گردی گوشه‌ها (اختیاری)
      //     ),
      //     child: const SingleChildScrollView(
      //       child: Padding(
      //         padding: EdgeInsets.all(16), // فاصله داخلی از بردر
      //         child: Column(
      //           children: [
      //             ImageSection(image: 'images/lake.jpg'),
      //             TitleSection(
      //               name: 'Mohammad Seyedabadi',
      //               location: 'Iran, Neyshabour',
      //             ),
      //             ButtonSection(),
      //             TextSection(
      //               description:
      //                   'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
      //                   'Bernese Alps. Situated 1,578 meters above sea level, it '
      //                   'is one of the larger Alpine Lakes. A gondola ride from '
      //                   'Kandersteg, followed by a half-hour walk through pastures '
      //                   'and pine forest, leads you to the lake, which warms to 20 '
      //                   'degrees Celsius in the summer. Activities enjoyed here '
      //                   'include rowing, and riding the summer toboggan run.',
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // 👈 برای وسط‌چین کردن افقی
        crossAxisAlignment: CrossAxisAlignment.center, // 👈 برای تراز عمودی وسط

        children: [
          // Expanded(
          /*1*/
          // child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children: [
          /*2*/
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Text(location, style: TextStyle(color: Colors.grey[500])),
          // Icon(Icons.star, color: Colors.red[500]),
          // const Text('41'),
        ],
        // ),
        // ),
        /*3*/

        // ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWithText(
              color: color,
              icon: Icons.call,
              label: 'CALL',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('CALL')),
                );
              },
            ),
            ButtonWithText(
              color: color,
              icon: Icons.near_me,
              label: 'ROUTE',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ROUTE')),
                );
              },
            ),
            ButtonWithText(
                color: color,
                icon: Icons.share,
                label: 'SHARE',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SHARE')),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: color.withOpacity(0.2),
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ],
            )));
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    // return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
    return CircleAvatar(
      radius: 50, // نصف قطر دایره (سایز)
      backgroundImage: AssetImage(image),
    );
  }
}
