const express=require("express");
const router=express.Router();
const pool=require("../pool");
///details
router.get("/",(req,res)=>{

  
  
  //按lid查询商品信息和规格列表
  var lid=req.query.lid, obj={product:{},pics:[]};
  (async function(){
    
    
   
    //1. 按lid查询商品信息——异步
    var sql="SELECT * FROM ld_product where lid=?";
    await new Promise(function(open){
      pool.query(sql,[lid],(err,result)=>{
        if(err) console.log(err);
        obj.product=result[0];
        open();
      })
    })
    
    //2. 按lid查询图片列表——异步
    var sql=`select * from ld_product_pic where product_id=?`;
    await new Promise(function(open){
      pool.query(sql,[lid],(err,result)=>{
        if(err) console.log(err);
        obj.pics=result;
        open(); 
      })
    })
    res.writeHead(200,{
      //防止乱码
      "Content-Type":"application/json;charset=utf-8",
      // 跨域
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(obj))
    res.end();

    



  })()
  

})
router.get("/ad",(req,res)=>{
  //查滚动广告商品表!!!!!!!!!!!!!!!!!
  var sql="SELECT * FROM ld_ad";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send(result);
    })
  })
module.exports=router;