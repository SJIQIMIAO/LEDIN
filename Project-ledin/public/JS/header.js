var $logout=$("#logout");
var $miao=$(".miao");
var uname=sessionStorage.getItem("uname");
if(uname){
var html=`欢迎回来${uname}&nbsp;&nbsp;&nbsp;<a href="logout.html">退出</a>`;
$logout.html(html)
$miao.html("");
}