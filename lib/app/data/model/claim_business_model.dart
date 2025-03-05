class ClaimBusiness {
  String? id;
  String ownerName;
  String businessEmail;
  String? website;
  String claimerId;
  String businessId;
  String phone;

  ClaimBusiness({
    this.id,
    required this.ownerName,
    required this.businessEmail,
    this.website,
    required this.claimerId,
    required this.businessId,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerName': ownerName,
      'businessEmail': businessEmail,
      'website': website,
      'claimerId': claimerId,
      'businessId': businessId,
      'phone': phone,
    };
  }
}
