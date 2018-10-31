const express=require("express")
const router=express.Router()
const pool=require("../pool")

///products
router.get("/",(req,res)=>{
  var sql=`SELECT * FROM ld_product `;
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    data={};
    data.pno=req.query.pno;
    data.pageCount=Math.ceil(result.length/12)
    data.products=result.slice(data.pno*12,data.pno*12+12)

    res.send(data);
  })
})

module.exports=router