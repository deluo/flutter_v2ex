  String getTimeDiff(timestamp){
    // 13位时间戳
    var curTimestamp = new DateTime.now();
    var time = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String showDate = "";
    var diff = curTimestamp.difference(time);
    if(diff.inDays !=0){
      showDate = showDate + diff.inDays.toString()+"天";
      timestamp = timestamp + 1000*60*60*24*diff.inDays;
      diff = curTimestamp.difference(DateTime.fromMillisecondsSinceEpoch(timestamp));
    }if(diff.inHours !=0){
      showDate = showDate + diff.inHours.toString()+"小时";
      timestamp = timestamp + 1000*60*60*diff.inHours;
      diff = curTimestamp.difference(DateTime.fromMillisecondsSinceEpoch(timestamp));
    }if(diff.inMinutes !=0){
      showDate = showDate + diff.inMinutes.toString()+"分钟";
      timestamp = timestamp + 1000*60*diff.inMinutes;
      diff = curTimestamp.difference(DateTime.fromMillisecondsSinceEpoch(timestamp));
    }
    if(showDate.indexOf('小时') == -1 && showDate.indexOf('分') == -1 && diff.inSeconds !=0){
      showDate = showDate + diff.inSeconds.toString()+"秒";
    }
    return showDate+"前";
  }