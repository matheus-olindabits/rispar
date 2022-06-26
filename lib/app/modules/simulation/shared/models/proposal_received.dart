import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class ProposalReceived {

  String id;
  String fullname;
  String email;
  int ltv;
  double contract_value;
  double net_value;
  double installment_value;
  double last_installment_value;
  double iof_fee;
  double origination_fee;
  int term;
  int collateral;
  double collateral_in_brl;
  double collateral_unit_price;
  String first_due_date;
  String last_due_date;
  double interest_rate;
  double monthly_rate;
  double annual_rate;
  
  ProposalReceived({
    required this.id,
    required this.fullname,
    required this.email,
    required this.ltv,
    required this.contract_value,
    required this.net_value,
    required this.installment_value,
    required this.last_installment_value,
    required this.iof_fee,
    required this.origination_fee,
    required this.term,
    required this.collateral,
    required this.collateral_in_brl,
    required this.collateral_unit_price,
    required this.first_due_date,
    required this.last_due_date,
    required this.interest_rate,
    required this.monthly_rate,
    required this.annual_rate,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'email': email,
      'ltv': ltv,
      'contract_value': contract_value,
      'net_value': net_value,
      'installment_value': installment_value,
      'last_installment_value': last_installment_value,
      'iof_fee': iof_fee,
      'origination_fee': origination_fee,
      'term': term,
      'collateral': collateral,
      'collateral_in_brl': collateral_in_brl,
      'collateral_unit_price': collateral_unit_price,
      'first_due_date': first_due_date,
      'last_due_date': last_due_date,
      'interest_rate': interest_rate,
      'monthly_rate': monthly_rate,
      'annual_rate': annual_rate,
    };
  }

  factory ProposalReceived.fromMap(Map<String, dynamic> map) {
    return ProposalReceived(
      id: map['id'] as String,
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      ltv: map['ltv'] as int,
      contract_value: map['contract_value'] as double,
      net_value: map['net_value'] as double,
      installment_value: map['installment_value'] as double,
      last_installment_value: map['last_installment_value'] as double,
      iof_fee: map['iof_fee'] as double,
      origination_fee: map['origination_fee'] as double,
      term: map['term'] as int,
      collateral: map['collateral'] as int,
      collateral_in_brl: map['collateral_in_brl'] as double,
      collateral_unit_price: map['collateral_unit_price'] as double,
      first_due_date: map['first_due_date'] as String,
      last_due_date: map['last_due_date'] as String,
      interest_rate: map['interest_rate'] as double,
      monthly_rate: map['monthly_rate'] as double,
      annual_rate: map['annual_rate'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProposalReceived.fromJson(String source) => ProposalReceived.fromMap(json.decode(source) as Map<String, dynamic>);
}
