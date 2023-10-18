Map<String, dynamic> mapData = {
  "error": 0,
  "data": {
    "programs": [
      {
        "totalRooms": 0,
        "id": 4,
        "program_name": "Quran Competition",
        "created_at": "2023-01-31T23:50:39.000000Z",
        "updated_at": "2023-01-31T23:50:39.000000Z",
        "event_id": 6
      },
      {
        "totalRooms": 0,
        "id": 5,
        "program_name": "Muslim’s Got Talent",
        "created_at": "2023-01-31T23:50:54.000000Z",
        "updated_at": "2023-01-31T23:50:54.000000Z",
        "event_id": 6
      },
      {
        "totalRooms": 0,
        "id": 6,
        "program_name": "Matrimonial Banquet",
        "created_at": "2023-01-31T23:51:19.000000Z",
        "updated_at": "2023-01-31T23:51:19.000000Z",
        "event_id": 6
      },
      {
        "totalRooms": 0,
        "id": 8,
        "program_name": "Young Youth",
        "created_at": "2023-01-31T23:52:45.000000Z",
        "updated_at": "2023-10-11T06:03:40.000000Z",
        "event_id": 6
      },
      {
        "totalRooms": 0,
        "id": 9,
        "program_name": "School",
        "created_at": "2023-01-31T23:52:56.000000Z",
        "updated_at": "2023-01-31T23:52:56.000000Z",
        "event_id": 6
      },
      {
        "totalRooms": 2,
        "id": 10,
        "program_name": "Daycare",
        "created_at": "2023-01-31T23:53:07.000000Z",
        "updated_at": "2023-01-31T23:53:07.000000Z",
        "event_id": 6
      },
      {
        "totalRooms": 1,
        "id": 13,
        "program_name": "Youth",
        "created_at": "2023-05-02T01:27:40.000000Z",
        "updated_at": "2023-05-02T01:27:40.000000Z",
        "event_id": 6
      }
    ]
  },
  "debug": null
};
void main(){
  List<dynamic>? data=[];
  var dataLength=mapData["data"]["programs"].length;
       for(int i=0;i<dataLength;i++){
       var datum=mapData["data"]["programs"][i]["program_name"];
       data.add(datum);
       }

  print(data);
}