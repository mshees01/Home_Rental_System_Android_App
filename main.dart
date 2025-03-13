import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return const MaterialApp(
      home: MyHomePage(title: 'My favourites'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedOption = 'Latest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          child: SafeArea(
            child: AppBar(
              backgroundColor: const Color(0xff1786A7),
              title: Container(
                color: const Color(0xff1786A7),
                width: 500,
                child: Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sort),
                        color: Colors.black,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                      items: <String>['Latest', 'Max price', 'Lowest price']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        _buildContainerWithImage('assets/images/house1.jpg', '📍 Location: 15 Green Avenue, Vasant Vihar, Delhi\n🏠 Type: 3 BHK \n💰 Rent: ₹35,000 per month\n📏 Area: 1,800 sq. ft.\n📞 Contact: 9876543211'),
                        const SizedBox(height: 10),
                        _buildContainerWithImage('assets/images/house2.jpg', '📍 Location: 22 Lotus Enclave, Rohini, Delhi\n🏠 Type: 2 BHK \n💰 Rent: ₹25,000 per month\n📏 Area: 1,400 sq. ft.\n📞 Contact: 9876543212'),
                        const SizedBox(height: 10),
                        _buildContainerWithImage('assets/images/house3.jpg', '📍 Location: 9 Rose Street, Saket, Delhi\n🏠 Type: 4 BHK \n💰 Rent: ₹50,000 per month\n📏 Area: 2,200 sq. ft.\n📞 Contact: 9876543213'),
                        const SizedBox(height: 10),
                        _buildContainerWithImage('assets/images/house4.jpg', '📍 Location: 18 Jasmine Lane, Dwarka, Delhi\n🏠 Type: 2 BHK \n💰 Rent: ₹20,000 per month\n📏 Area: 1,300 sq. ft.\n📞 Contact: 9876543214'),
                        const SizedBox(height: 10),
                        _buildContainerWithImage('assets/images/house5.jpg', '📍 Location: 30 Tulip Towers, Lajpat Nagar, Delhi\n🏠 Type: 3 BHK \n💰 Rent: ₹30,000 per month\n📏 Area: 1,600 sq. ft.\n📞 Contact: 9876543215'),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.home,
                color: Color(0xff276678),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.favorite,
                color: Color(0xff276678),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.bookmark,
                color: Color(0xff276678),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.settings,
                color: Color(0xff276678),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.person,
                color: Color(0xff276678),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithImage(String assets, String description) {
    return Container(
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xffD3E0EA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              assets,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
