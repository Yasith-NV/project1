class Ticket {
  final String id;
  final String name;
  final String email;
  final String contactNumber;
  final String message;

  Ticket({
    this.id = '',
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'contact_number': contactNumber,
      'message': message,
    };
  }

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      contactNumber: json['contact_number'] as String,
      message: json['message'] as String,
    );
  }
}
