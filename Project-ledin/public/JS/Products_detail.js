// 放大镜等等//////////////////////////////////////////////////////////////////////////////////////////////////
$(function(){
    (async  function(){
        
        if(location.search.indexOf("lid=")!=-1){//因为请求的路径要加上？lid=某个lid
        var lid=location.search.split("=")[1];
              //         ?lid=5   ?lid,5   5

        var res=await $.ajax({
            
            url:"http://127.0.0.1:3000/details/",
            type:"get",
            data:`lid=${lid}`,
            dataType:"json"
        });
        console.log(res);
    }
        var {product,pics}=res;
        new Vue({
            el:"#detail",
            data:{
                product,
                pics
            }
        })
        
        // 点击小图切换大图
        var $ul=$(".recommend1_ul ul");//放一排sm图片的ul
        var $img=$("#detailleft>div>img");//md图片
        var $lgDiv=$("#div-lg");//放lg图片的div
        // 把初始的背景图片设成刚刷新时的图片,即第一张
        var lg=$(".recommend1_ul ul li img").attr("data-lg");
        $lgDiv.css(
            "backgroundImage",`url(${lg})`
          )
        $ul.on("click","img",function(){
            var md=$(this).attr("data-md");
            var lg=$(this).attr("data-lg");//要给html中的每个小图加上自定义扩展属性”data-xx“
            $img.attr("src",md);
            //单击换图片后再把背景图片换成相应的图片
            //给放lg图片的div加上背景图片
            $lgDiv.css(
                "backgroundImage",`url(${lg})`
              )
            
        })




        // 放大镜
        
        //最小的粉色遮罩层
        var $mask=$("#mask");
        //中间的透明遮罩层
         $smask=$("#super-mask");
        var MSIZE=176,SMSIZE=600,MAX=SMSIZE-MSIZE;
        $smask.hover(
            function(){
            $mask.toggleClass("d-none");
            $lgDiv.toggleClass("d-none");
            }
        ).mousemove(function(e){
            var top=e.offsetY-MSIZE/2;
            var left=e.offsetX-MSIZE/2;
            if(top<0) top=0; else if(top>MAX) top=MAX;
            if(left<0) left=0; else if(left>MAX) left=MAX;
            $mask.css({top,left})
            $lgDiv.css(
            "backgroundPosition",
            `${-2*left}px ${-2*top}px`
            )
        })
    // 滚动广告商品!!!!!!!!!!!!!!
    var res=await $.ajax({
        url:"http://127.0.0.1:3000/details/ad",
        type:"GET",
        data:{},
        dataType:"json"
    })
    new Vue({
        el:"#ad",
        data:{
            res
        }

    })



    // 左右滚动的图片
    var flag = "left";//要把这个放到请求数据的后面,不然出不来哒!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function scroll(wraper,prev,next,img,or) {

        var wraper = $(wraper);
        var prev = $(prev);
        var next = $(next);
        var img = $(img).find("ul");
        var w = img.find("li").outerWidth(true);
        next.click(function(){
            img.animate({ "margin-left":-w},function(){
                img.find("li").eq(0).appendTo(img);
                img.css({ "margin-left":0});
            });
            flag = "left";
        });
        prev.click(function(){
            img.find("li:last").prependTo(img);
            img.css({ "margin-left":-w});
            img.animate({ "margin-left":0 });
            flag = "right";
        });
        if(or==true){
            var ad=setInterval(function(){ flag == "left" ? next.click():prev.click()},3000);
            wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function (){ flag == "left" ? next.click():prev.click()},2000);});
        }
    }
    scroll("div#recommend","#recommend div.prev","#recommend div.next","#recommend div.recommend_ul",true);
    scroll("div#recommend1","#recommend1 div.prev","#recommend1 div.next","#recommend1 div.recommend1_ul",false);

    // 增加商品的加减按钮


    var add=$("#add");
    var sub=$("#sub");
    var count=$("#count");
    var num=count.val();
    add.click(function(){
        num++;
        count.val(num);
    })

    sub.click(function(){
        if(count.val()>0){
        num--;
        count.val(num);
        }
    })








    })();

    

})
