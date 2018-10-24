const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.get("/uname",(req,res)=>{
    var uname=req.query.uname;
    var sql="SELECT * FROM ld_user WHERE uname=?";
    pool.query(sql,[uname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){res.send("1")}
                            else{res.send("0")}
    })
})

router.post("/add",(req,res)=>{
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    var email=req.body.email;
    var phone=req.body.phone;
    var sql="INSERT INTO ld_user VALUES(null,?,?,?,?,null,null,null)";
    pool.query(sql,[uname,upwd,email,phone],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows==1){
            res.send("1");
        }else{
            res.send("0");
        }
    })
})
module.exports=router;