import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridge Kings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // To track which step button is selected
  String selectedStep = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Text('About Us'),
              ],
            ),
            Row(
              children: [
                Text('Services'),
                SizedBox(width: 20),
                Text('Contact'),
                SizedBox(width: 20),
                Text('Support'),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Title, Search Bar, and Cart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cartridge Kings',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Image with Text from URL
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/600x250/0000FF/808080?Text=Cartridge+Kings'), // Ganti dengan URL gambar
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // 3 Steps Easy Search with Select Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3 Step Easy Search',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Column containing the Step Buttons
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            _StepButton('Step 1', 'Choose your printer brand'),
                            _StepButton('Step 2', 'Select your printer model'),
                            _StepButton('Step 3', 'Pick your cartridge'),
                          ],
                        ),
                      ),
                      // Find Cart Button next to Step 3
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary:
                                Colors.blueAccent, // Custom color for button
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Find Cart',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 3 Product Cards with Price and Add to Cart Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Featured Cartridges',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _ProductCard('Printer Cartridge 1', '\$25.99'),
                      _ProductCard('Printer Cartridge 2', '\$19.99'),
                      _ProductCard('Printer Cartridge 3', '\$29.99'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Step Button widget to display Select buttons for each step
  Widget _StepButton(String step, String description) {
    bool isSelected = selectedStep == step; // Check if the step is selected

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedStep = step; // Set the selected step when clicked
        });
      },
      style: ElevatedButton.styleFrom(
        primary: isSelected
            ? Colors.blueAccent
            : Colors.grey, // Change color based on selection
        padding: EdgeInsets.symmetric(
            vertical: 12, horizontal: 40), // Same size as 'Find Cart'
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        step,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _ProductCard(String productName, String price) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              productName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

