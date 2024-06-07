import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ticket_details.dart';  

class TicketsList extends StatefulWidget {
  @override
  _TicketsListState createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted Tickets'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('contacts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['name']),
                      subtitle: Text(data['message'],),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _confirmDeleteTicket(document.id),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TicketDetail(documentId: document.id),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: Text(
                    "No tickets found",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
          }
        },
      ),
    );
  }

  void _confirmDeleteTicket(String documentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to permanently delete this ticket?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                _deleteTicket(documentId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteTicket(String documentId) {
    _firestore.collection('contacts').doc(documentId).delete().then((_) {
      Fluttertoast.showToast(msg: 'Ticket deleted successfully');
    }).catchError((error) {
      Fluttertoast.showToast(msg: 'Error deleting ticket: $error');
    });
  }
}
