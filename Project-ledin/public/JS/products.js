$(function(){
    function loadPage(pno=0){
    //   if(location.search.indexOf("kw=")!=-1){
        //header.js:23 $input.val(decodeURI(kw))
        // var kw=decodeURI(
        //   location.search.split("=")[1]
        // );
        $.ajax({
          url:"http://127.0.0.1:3000/products/",
          type:"get",
        //   data:{},
          data:{pno},
          dataType:"json",
          success:function(data){

              console.log(data);
            var {pno,pageCount,products}=data;
            var html="";
            for(var {spic,newprice,title,lid} of products){
                html+=`<div class="col-md-3  position-relative p-0 mt-3 mb-3">
                <div class="text-center">
                    <div class="position-absolute w-100 h-75 my_div"><a href="products_details.html?lid=${lid}" class="text-white">&lt;查看详情&gt;</a></div>
                    <img src="${spic}" class="img-fluid"/>
                    <p class="text-danger font-weight-bold mt-3">￥${newprice.toFixed(2)}</p>
                    <a href="products_details.html?lid=${lid}" class="small my_a">${title}</a>
                </div>
            </div>`
            }

            $("#plist").html(html);
    
            var html=`<li class="border p-2 m-1 my_bg"><a href="#" class="text-white">上一页</a></li>`;
            for(var i=1;i<=pageCount;i++){
              html+=`<li class=" ${pno==i-1?'active':''} border p-2 m-1 my_bg"><a href="#" class="text-white">${i}</a></li>`;
            }
            html+=`<li class="border p-2 m-1 my_bg"><a href="#" class="text-white">下一页</a></li>`;
            var $page=$("#pagination")
            $page.html(html);

            if(pno==0)
              $page.children(":first").addClass("disabled")
            if(pno==pageCount-1)
              $page.children(":last").addClass("disabled")
          }
        })
    //   }
    }
    loadPage();

    $("#pagination").on("click","a",function(e){
      e.preventDefault();
      var $a=$(this);
      if(!$a.parent().is(".disabled,.active")){
        if($a.html()=="上一页"){
            var pno=$a.parent().siblings(".active").children().html()-2
        }else if($a.html()=="下一页"){
            var pno=$a.parent().siblings(".active").children().html();
        }else{
          var pno=$a.html()-1;
        }
        loadPage(pno);
      }
    })
  })