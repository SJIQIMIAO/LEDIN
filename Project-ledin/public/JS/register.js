$(function(){
    var $uname=$("input[name='uname']");
    var $upwd=$("input[name='upwd']");
    var $email=$("input[name='email']");
    var $phone=$("input[name='phone']");
    var $regbtn=$("#regbtn");
    var $p=$("#msg");
    var uname,upwd,email,phone;
    $uname.blur(function(){
        if(!$(this).val()){
            $p.html("用户名称不能为空")
        }else{
            $p.html("");
            uname=$(this).val();
        }
    })
    $upwd.focus(function(){
        $.ajax({
            url:"http://127.0.0.1:3000/register/uname",
            type:"get",
            data:{uname},
            success:function(data){ 
                if(data==1){
                    $p.html("用户名已存在");
                    $uname.val("");
                }
            }
        })
    })
    $upwd.blur(function(){
        if(!$(this).val()){
            $p.html("密码不能为空")
        }else{
            $p.html("");
            upwd=$(this).val();
            var reg=/^\d{6,8}$/;
            if(!reg.test(upwd)){
                $p.html("密码的长度应在6~8位");
            }
        }
    })
    $phone.blur(function(){
        if(!$(this).val()){
            $p.html("电话号码不能为空")
        }else{
            $p.html("");
            phone=$(this).val();
            var reg=/^1[34578]\d{9}$/;
            if(!reg.test(phone)){
                $p.html("请输入正确格式的电话号码");
            }
        }
    })
    $email.blur(function(){
        if(!$(this).val()){
            $p.html("邮箱不能为空")
        }else{
            $p.html("");
            email=$(this).val();
            var reg=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            if(!reg.test(email)){
                $p.html("请输入正确格式的邮箱格式");
            }
        }
    })

    // 注册
    $regbtn.click(function(e){
        e.preventDefault();
        if(uname&&upwd&&email&&phone){//只有所有信息都填完整才可以点提交
        $.ajax({
            url:"http://127.0.0.1:3000/register/add",
            type:"post",
            data:{
                uname,
                upwd,
                email,
                phone
            },
            success:function(data){
                if(data==1){
                    alert("注册成功,1秒后跳转到登录页面");
                    setTimeout(function(){
                        location.href="http://127.0.0.1:3000/login.html";
                    },1000)
                        $uname.val("");
                        $upwd.val("");
                        $phone.val("");
                        $email.val("");    
                }
            }
        })
    }
    })
})