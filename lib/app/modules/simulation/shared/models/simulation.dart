import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class Simulation {

String fullname;
String email;
int ltv;
double amount;
int term;
bool has_protected_collateral;

  Simulation({
    required this.fullname,
    required this.email,
    required this.ltv,
    required this.amount,
    required this.term,
    required this.has_protected_collateral,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'ltv': ltv,
      'amount': amount,
      'term': term,
      'has_protected_collateral': has_protected_collateral,
    };
  }

  factory Simulation.fromMap(Map<String, dynamic> map) {
    return Simulation(
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      ltv: map['ltv'] as int,
      amount: map['amount'] as double,
      term: map['term'] as int,
      has_protected_collateral: map['has_protected_collateral'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Simulation.fromJson(String source) => Simulation.fromMap(json.decode(source) as Map<String, dynamic>);
}
