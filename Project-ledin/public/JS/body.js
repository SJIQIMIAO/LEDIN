$(function(){
    
    (async function(){//别忘记调用！！！！！！！！！！！！！！！！！！！！！！！！
          
        var res=await $.ajax({
            url:"http://127.0.0.1:3000/index/imglist",
            type:"get",
            dataType:"json",

        });
        new Vue({
            el:"#carousel",
            data:{
                res
            }
            
        })
        
        $("#carousel").children("div:first-child").addClass("active");
    })();
})



