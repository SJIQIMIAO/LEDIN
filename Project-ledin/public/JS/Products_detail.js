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
            `${-2.326*left}px ${-2*top}px`
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

// /*评论表*/ 
if(location.search.indexOf("lid=")!=-1){
    var lid=location.search.split("=")[1];
    //console.log(lid)
    var p = new Promise((resolve,reject)=>{
         var comment=$.ajax({
                url:"http://127.0.0.1:3000/details/comment",
                type:"get",
                data:`lid=${lid}`,
                dataType:"json"
            })
           
            resolve(comment);
    })
   }
p.then((res)=>{
//console.log(res.data);

new Vue({
    el:"#comment",
    data:{
        comment:res.data,
        msg:"",
        pageIndex:0
    },
    methods:{
        postComment(){
            //发表评论
            var username="匿名用户"; //用户名
            //console.log(lid)
            var bid=lid;      
            var content=this.msg;  //双向绑定留言内容
            //console.log(content)
            //对留言内容验证大于2
            //console.log(username+":"+nid+":"+content)
            var url="details/saveComment";
            var obj={bid:bid,content:content,username:username};
            $.ajax({
                url:url,
                type:"post",
                data:obj
            }).then(result=>{ 
                if(result.code==1){
                    
                    //1.添加完成清空原有内容
                    this.msg="";
                    //2.提示
                   // Toast(result.body.msg);
                    this.pageIndex=0;  //将当前页码清零
                    this.comment=[];      //数据值清空
                    this.getCommentList();//加载第一页
                }//else{
                //     Toast(result.body.msg)
                // }
            })



        },
        getCommentList(){
            //当前页+1
            this.pageIndex++;
            //url地址
            // console.log(lid)
            var url="details/comment?lid="+lid;
               url+="&pno="+this.pageIndex;
            //console.log("1111"+this.comment)
            $.ajax({
                    url:url,
                    type:"get",
                    dataType:"json",
                    // success:function(res){
                        
                    //     //this.comment=res.data;
                    //     // this.comment=this.comment.concat(res.data)
                    // }
                }).then(res=>{  //相当于success  因为在ajax中访问不到this.comment，所以用.then
                    //console.log(res);
                    //console.log(this.comment)
                    this.comment=res.data;
                    //console.log("2222"+this.comment)
                })
        }
    },
    mounted(){
        this.getCommentList();
        //console.log(213)
    }
    
})
}) 


/*评论选项卡切换 */
$(document).ready(function(){
    $(".my_details li").click(function(){
        $(this).addClass("hover").siblings().removeClass("hover");
        $(".details_parent").children().eq($(this).index()).show().siblings().hide();
    })
})





    })();

    

})
