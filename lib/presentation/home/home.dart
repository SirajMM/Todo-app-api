import 'package:api_test/application/home_provider.dart';
import 'package:api_test/presentation/add_task/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/home_item_tile.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().fetchTodoAllList();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () => context.read<HomeProvider>().fetchTodoAllList(),
          child: Consumer<HomeProvider>(
            builder: (context, homeprovider, child) =>
                homeprovider.users.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            ItemTile(index: index, homeprovider: homeprovider),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: homeprovider.users.length,
                      )
                    : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddTask(),
            ),
          );
        },
        label: const Text('Add Task'),
      ),
    );
  }
}
