import 'package:flutter/material.dart';
import 'package:my_kitchen_cart_test/VIEWS/phone_entry_view.dart';
import 'package:my_kitchen_cart_test/constants.dart';

class SocietySelectView extends StatefulWidget {
  const SocietySelectView({Key key}) : super(key: key);

  @override
  _SocietySelectViewState createState() => _SocietySelectViewState();
}

class _SocietySelectViewState extends State<SocietySelectView> {
  String selectedCity = "Bangalore";

  final placesInBangalore = [
    {
      "placeName": "S V Neelamm (Bulk Orders)",
      "address": "Indira Nagar, Bangaore"
    },
    {"placeName": "Ganga Apartment", "address": "Banaswadi, Bangaore"},
    {"placeName": "Golden Enclave Apartments", "address": "Domlur, Bangaore"},
    {"placeName": "Shriram Spandhana", "address": "Challagatta, Bangaore"},
    {"placeName": "Keerthi Enclave", "address": "Dhoddana kundi, Bangaore"},
  ];
  final placesInHyd = [
    {"placeName": "Abc Colony", "address": "Indira Nagar, Hyd"},
    {"placeName": "Shilla Apartment", "address": "Banaswadi, Hyd"},
    {"placeName": "Kilo Apartments", "address": "Domlur, Hyd"},
    {"placeName": "Shriram Spandhana", "address": "Challagatta, Hyd"},
    {"placeName": "Enclave", "address": "Dhoddana kundi, Hyd"},
  ];

  buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintText: "Search for your society",
            hintStyle: TextStyle(color: Colors.grey[400]),
            enabledBorder: InputBorder.none,
            fillColor: Colors.grey[100]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: selectedCity,
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
              print(selectedCity);
            },
            items: [
              DropdownMenuItem(
                child: Text("Bangalore"),
                value: "Bangalore",
                onTap: () {
                  selectedCity = "Bangalore";
                },
              ),
              DropdownMenuItem(
                child: Text("Hyderabad"),
                value: "Hyderabad",
                onTap: () {
                  selectedCity = "Hyderabad";
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            buildSearchBar(),
            VERTICALSPACING,
            Text(
              "SOCIETIES NEAR YOU",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            VERTICALSPACING,
            Expanded(
              child: ListView.separated(
                  itemBuilder: (bc, index) {
                    var place = selectedCity == "Bangalore"
                        ? placesInBangalore
                        : placesInHyd;
                    print("cah");
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (bc) => PhoneEntryView(),
                          ),
                        );
                      },
                      title: Text(
                        place[index]["placeName"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(place[index]["address"]),
                    );
                  },
                  separatorBuilder: (bc, index) {
                    return Divider();
                  },
                  itemCount: placesInBangalore.length),
            ),
          ],
        ),
      ),
    );
  }
}
