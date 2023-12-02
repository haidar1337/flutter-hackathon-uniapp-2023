import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final TextEditingController issuesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          // Set the AppBar icon color to white
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        elevation: 5,
        title: Text(
          'Help',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onPrimary,
            shadows: [
              Shadow(
                blurRadius: 1.0,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(2, 2),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How can we help you?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            const Text(
                'If you are facing any issues or need assistance, please let us know. Check out the FAQs or contact us directly.'),
            const SizedBox(height: 20),
            // FAQs Section
            ListTile(
              title: const Text('Frequently Asked Questions'),
              leading: const Icon(Icons.question_answer),
              onTap: () {
                // Navigate to FAQs page
              },
            ),
            ListTile(
              title: const Text('Contact Support'),
              leading: const Icon(Icons.contact_phone),
              onTap: () {
                // Navigate to Contact Support page
              },
            ),
            const Divider(),
            const SizedBox(height: 20),
            // Report Issue Section
            Text(
              'Report an Issue',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: issuesController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Describe your issue here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle issue submission
              },
              child: const Text('Submit Issue'),
            ),
          ],
        ),
      ),
    );
  }
}
