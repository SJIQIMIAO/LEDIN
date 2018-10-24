const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.post("/test",(req,res)=>{
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    var sql="SELECT * FROM ld_user WHERE uname=? AND upwd=?";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){res.send("0")}
                            else{res.send("1")}
    })
})
module.exports=router;