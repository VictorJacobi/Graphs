class GraphData{
    // String? ngoName;
    String? fullName;
    String? husbandOccupation;
    String? lga;
    String? employmentStatus;
    String? ngoName;
    String? ngoMembership;//This gives the affliation to NGO
    String? husbandBereavementDate;//To give the years spent as a widow
    String? dob;//to give the widows at spouse bereavement - subtraction
    String? occupationServicesType;

GraphData({this.fullName,this.husbandOccupation,this.lga,this.employmentStatus,this.ngoName,this.ngoMembership,this.husbandBereavementDate,this.dob,this.occupationServicesType});

factory GraphData.fromJson(Map<String,dynamic> jsonData){
  return GraphData(
    fullName: jsonData['fullName'],
    lga: jsonData['lga'],
    employmentStatus: jsonData['employmentStatus'],
    ngoName: jsonData['ngoName'],
    ngoMembership: jsonData['ngoMembership'],
    husbandBereavementDate: jsonData['husbandBereavementDate'],
    dob: jsonData['dob'],
    occupationServicesType: jsonData['occupation'],
  );
}
    @override
    String toString() => """
fullName: $fullName,
husbandOccupation: $husbandOccupation,
lga: $lga,
employmentStatus: $employmentStatus,
ngoName: $ngoName,
ngoMembership: $ngoMembership,
husbandBereavementDate: $husbandBereavementDate,
dob: $dob,
occupationServicesType: $occupationServicesType,
""";

}