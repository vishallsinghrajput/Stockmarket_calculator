import 'package:flutter/material.dart';

void main() {
  runApp(StockApp());
}

class StockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Market Calculator',
      home: StockCalculator(),
    );
  }
}

class StockCalculator extends StatefulWidget {
  @override
  _StockCalculatorState createState() => _StockCalculatorState();
}

class _StockCalculatorState extends State<StockCalculator> {
  double buyingPrice = 0.0;
  double sellingPrice = 0.0;
  int lot = 0;
  double profit = 0.0;

  void _calculateProfit() {
    setState(() {
      profit = (sellingPrice - buyingPrice)/2 * lot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Stock Profit Calculator')),
        ),
        body: Container(color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(textBaseline: null,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(shape: Border.all(color: Colors.red),
                    color: Colors.red,
                    elevation: 20.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Buying Price',prefixIcon: Icon(Icons.currency_rupee)),
                      onChanged: (value) {
                        setState(() {
                          buyingPrice = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 12,),
                  Card(shape: Border.all(color: Colors.red),
                    color: Colors.red,
                    elevation: 30.0,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Selling Price',prefixIcon: Icon(Icons.currency_rupee)),
                      onChanged: (value) {
                        setState(() {
                          sellingPrice = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 12,),
                  Card(
                    color: Colors.red,
                    elevation: 30.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Lot Size',
                      prefixIcon: Icon(Icons.wallet_rounded)),
                      onChanged: (value) {
                        setState(() {
                          lot = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(elevation: 90.0,shadowColor: Colors.black,
                    child: SizedBox(height: 50,width: 200,
                      child: ElevatedButton(style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.all(Colors.red)),
                        onPressed: _calculateProfit,
                        child: const Text('Calculate Profit',
                            style:TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 15),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Profit: \$${profit.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
             ),
        ),
        );
    }
}