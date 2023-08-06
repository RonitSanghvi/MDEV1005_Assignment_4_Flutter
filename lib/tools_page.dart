import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key? key}) : super(key: key); // Constructor for the ToolsPage widget.

  @override
  _ToolsPageState createState() => _ToolsPageState(); // Creates the state for the ToolsPage widget.
}

class _ToolsPageState extends State<ToolsPage> {
  // Items has all the data. While newItem is used to add new data.
  List<String> items = []; // List to store the items/data in the To-Do list.
  final TextEditingController _textEditingController =
  TextEditingController(); // Controller for the input text field.

  // Adding New Items.
  void handleAddItem() {
    String newItem = _textEditingController.text.trim(); // Get the text from the input field and trim any extra spaces.
    if (newItem.isNotEmpty) {
      // Only add a new item if it is not empty.
      setState(() {
        items.add(newItem); // Add the new item to the list of items.
      });
      _textEditingController.clear(); // Clear the input field after adding the item.
    }
  }

  // Deleting items
  void handleDeleteItem(int index) {
    setState(() {
      items.removeAt(index); // Remove the item at the specified index from the list.
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose(); // Dispose the text controller when the state is disposed to prevent memory leaks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do List')), // AppBar with a title for the To-Do list page.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Add new item'), // Input text field with a label.
              controller: _textEditingController, // Associate the text controller with the input field.
            ),
            const SizedBox(height: 20), // Some spacing between the input field and the button.
            ElevatedButton(
              onPressed: handleAddItem, // When the button is pressed, it calls the handleAddItem function.
              child: const Text('Add New Data'), // Button text.
            ),
            const SizedBox(height: 20), // Some spacing between the button and the list view.
            Expanded(
              child: ListView.builder(
                itemCount: items.length, // The number of items in the list view.
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]), // Display the item at the specified index in the list.
                    trailing: IconButton(
                      icon: const Icon(Icons.delete), // Delete icon for each list item.
                      onPressed: () => handleDeleteItem(index), // When the delete icon is pressed, it calls the handleDeleteItem function with the index of the item to be deleted.
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
