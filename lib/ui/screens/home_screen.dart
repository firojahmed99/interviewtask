import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/api_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = Get.find<ApiController>();

    // fetch once when screen is first built
    if (api.users.isEmpty) {
      api.fetchUsers();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Obx(() {
        if (api.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (api.error.isNotEmpty) {
          return Center(child: Text('Error: ${api.error}'));
        }
        if (api.users.isEmpty) {
          return const Center(child: Text('No data'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: api.users.length,
          itemBuilder: (_, i) {
            final u = api.users[i];

            // safely extract values
            final title = u['name']?.toString() ??
                u['id']?.toString() ??
                'Item $i';

            String subtitle = '';
            if (u.containsKey('data') && u['data'] is Map) {
              final dataMap = u['data'] as Map;
              subtitle = dataMap.entries
                  .map((e) => '${e.key}: ${e.value}')
                  .join(', ');
            }

            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(title),
                subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
              ),
            );
          },
        );
      }),
    );
  }
}
