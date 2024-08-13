import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;
  bool isLoading = true; // For loading state

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString('user');
    if (userDataString != null) {
      setState(() {
        Map<String, dynamic> user = jsonDecode(userDataString);
        print("UID: ${user['uid']}");
        fetchUserData(user['uid']);
      });
    } else {
      // Handle the case where user data is not available in SharedPreferences
      print('No user data found in SharedPreferences');
    }
  }

  Future<void> fetchUserData(String uid) async {
    print('Fetching data for UID: $uid');
    final response = await http.get(Uri.parse('https://api.differentdentalumy.com/getprofile.php?uid=$uid'));
    print('HTTP status code: ${response.statusCode}');
    
    if (response.statusCode == 200) {
      try {
        List<dynamic> responseData = jsonDecode(response.body);

        if (responseData.isNotEmpty) {
          setState(() {
            // Assuming there's only one user profile in the array
            userData = responseData[0]; 
            isLoading = false;
            print('Parsed User Data: $userData');
          });
        } else {
          print('No user data found');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        automaticallyImplyLeading: false,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Gambar profil
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://example.com/profile-image.jpg', // Default profile image URL
                      ),
                    ),
                  ),

                  // Nama dan Deskripsi
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData?['username'] ?? 'Username', // Use fetched data
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Informasi Kontak
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.0),
                        Text(
                          'Informasi Pengguna',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.book),
                          title: Text(userData?['NIK'] ?? 'NIK'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(userData?['nama_lengkap'] ?? 'Nama Lengkap'),
                        ),
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text(userData?['email'] ?? 'Email'),
                        ),
                        ListTile(
                          leading: Icon(Icons.child_care),
                          title: Text(userData?['namaanak'] ?? 'Nama Anak'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
