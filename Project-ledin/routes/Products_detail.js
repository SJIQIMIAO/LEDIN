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


  /*分页显示评论表 */
router.get("/comment",(req,res)=>{
  //console.log(11)
  //1 参数 pno pagesize bid
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  // var bid=parseInt(req.query.bid);
  var lid=req.query.lid;
  if(!pno){pno=1}
  if(!pageSize){pageSize=8}
  //2 sql
  var obj={pno:pno,pageSize:pageSize,lid:lid};
  var progress=0;
  var sql=`SELECT count(id) as c FROM ld_comment WHERE bid=?`;
  
  //当前页内容
  pool.query(sql,[lid],(err,result)=>{
      if(err)throw err;
      obj.pageCount=Math.ceil(result[0].c/pageSize);
      progress+=50;
      if(progress==100){
          res.send(obj)
          console.log(obj)
      }
  })
  var offset=0;
  var x=pno*pageSize;
  pageSize=parseInt(x);
  // console.log(lid);
  
  var sql=`SELECT * FROM ld_comment WHERE bid=? LIMIT ?,?`;
  pool.query(sql,[lid,offset,pageSize],(err,result)=>{
      if(err)throw err;
      obj.data=result;
      progress+=50;
      if(progress==100){
          res.send(obj)
      }
  })
  /*var lid=req.query.lid;
  var sql=`SELECT * FROM ddw_comment WHERE book_id=?`;
  pool.query(sql,[lid],(err,result)=>{
      if(err)throw err;
      res.send(result)
  })*/
})

//功能四：添加一条评论
router.post("/saveComment",(req,res)=>{
  //1.参数 nid username content 
  console.log(req.body);
  var bid=parseInt(req.body.bid);        //书本编号
  var username=req.body.username;  //用户名
  var content=req.body.content;   //评论内容
  //2.content  不能为空  长度大于2
  /*if(content.length<2){
      res.send({code:-1,msg:"内容太少"})
      return;
  }*/
  //3.sql INSERT INTO `xz_comment`(`id`, `nid`, `ctime`, `content`,
  // `username`, `isdel`) VALUES ([value-1],[value-2],[value-3],
  //[value-4],[value-5],[value-6])
  var sql=" INSERT INTO `ld_comment`(`id`, `bid`, `ctime`, `content`,";
     sql+=" `username`, `isdel`) VALUES (null,?,now(),";
     sql+=" ?,?,0)";
  pool.query(sql,[bid,content,username],(err,result)=>{
      if(err) throw err;
      //执行成功条件：影响行数
      if(result.affectedRows==1){
      //console.log(result);
      res.send({code:1,msg:"添加成功"})
      
      }else{
          res.send({code:-1,msg:"添加失败"})
      }   
  })
})
module.exports=router;