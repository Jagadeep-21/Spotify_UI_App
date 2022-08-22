class Users {
  String? imageUrl;
  String ?songName;
  String ?musicDirectorName;
  int ?count ;
  String? edited_ago;

  Users({this.imageUrl, this.songName, this.musicDirectorName,this.count,this.edited_ago});

  Users.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    songName = json['song_name'];
    musicDirectorName = json['music_directorName'];
    count=json['song_count'];
    edited_ago=json['edited_ago'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['imageUrl'] = this.imageUrl;
  //   data['song_name'] = this.songName;
  //   data['music_directorName'] = this.musicDirectorName;
  //   return data;
  // }
}
