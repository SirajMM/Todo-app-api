import 'package:flutter/material.dart';

import '../../../application/home_provider.dart';
import '../../add_task/add_task_screen.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.index,
    required this.homeprovider,
  });
  final int index;
  final HomeProvider homeprovider;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        child: Text('${index + 1}'),
      ),
      title: Text(homeprovider.users[index]["title"]),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == 'delete') {
            homeprovider.deleteTodo(homeprovider.users[index]["_id"]);
          } else if (value == 'edit') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScreenAddTask(data: homeprovider.users[index]),
                ));
          }
        },
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.delete_forever_outlined), Text('Delete')],
              ),
            ),
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.edit), Text('Edit')],
              ),
            )
          ];
        },
      ),
    );
  }
}
