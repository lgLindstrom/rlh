import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // BUILD UI
  @override
  Widget build(BuildContext context ) {
    //nal provider = ref.watch(userProfileStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            // profile picI
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(25),
              child: const Icon(
                Icons.person,
                size: 100,
              ),
            ),

            const SizedBox(height: 25),

            // email
           //Tet(provider.email),
            const SizedBox(height: 25),
          //Text(provider.fullname ?? ' '),
          ],
        ),
      ),
    );
  }
}
