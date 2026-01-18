class ReportModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String date;
  final int imageCount;
  final String? adminResponse;
  final String? responseDate;
  final String? adminName;

  ReportModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.date,
    required this.imageCount,
    this.adminResponse,
    this.responseDate,
    this.adminName,
  });

  // 🔥 DARI API LARAVEL
  factory ReportModel.fromApi(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] != null
          ? json['category']['name']
          : '-',
      status: json['status'] ?? 'Diproses',
      date: json['created_at'] ?? '',
      imageCount: json['media'] != null
          ? (json['media'] as List).length
          : 0,
      adminResponse: json['admin_response'],
      responseDate: json['response_date'],
      adminName: json['admin_name'] ?? 'Admin',
    );
  }

  static fromJson(json) {}
}
