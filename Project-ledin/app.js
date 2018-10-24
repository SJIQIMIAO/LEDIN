//使用express构建web服务器 --11:25
const express = require('express');
const bodyParser = require('body-parser');
/*引入路由模块*/
const index=require("./routes/body");
const details=require("./routes/Products_detail");
const products=require("./routes/products");
const login=require("./routes/login");
const register=require("./routes/register");

var app = express();
var server = app.listen(3000);
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/details",details);
app.use("/products",products);
app.use("/login",login);
app.use("/register",register);
//http://localhost:3000/products/?kw=macbook i7 128g

