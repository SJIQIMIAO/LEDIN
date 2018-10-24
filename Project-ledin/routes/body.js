const express=require("express");
const router=express.Router();
const pool=require("../pool");
///details
router.get("/imglist",(req,res)=>{
  //按lid查询商品信息和规格列表
  var sql="SELECT cid,img,href FROM ld_index_carousel";
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send(result);
  })
})

module.exports=router;