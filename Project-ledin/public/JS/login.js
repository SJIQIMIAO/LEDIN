$(function(){
    var $uname=$("input[name='uname']");
    var $upwd=$("input[name='upwd']");
    var $p=$(".msg");
    var $logbtn=$("#logbtn")
    var uname=$uname.val();
    var upwd=$upwd.val();
    $uname.blur(function(){
        if(!$uname.val()){
            $p.html("用户名不能为空")
        }else{
            $p.html("");
            uname=$uname.val();
        }
    })
    $upwd.blur(function(){
        if(!$upwd.val()){
            $p.val("用户密码不能为空")
        }else{
            $p.html("");
            upwd=$upwd.val();
        }
    })
    $logbtn.click(function(e){
        e.preventDefault();
        sessionStorage.setItem("uname",uname)
        $.ajax({
            url:"http://127.0.0.1:3000/login/test",
            type:"POST",
            data:{
                uname,
                upwd
            },
            success:function(res){
                if(res==0){
                    alert("登陆成功,1秒后跳转到首页")
                    
                    setTimeout(function(){
                        location.href="http://127.0.0.1:3000/body.html"
                    },1000)
                }else{
                    $p.html("用户名或密码不正确");
                    $uname.val("");
                    $upwd.val("");
                    $uname.focus();
                }
            }
        })
    })
})