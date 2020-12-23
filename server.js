const express = require('express');
const path = require('path');
const app = express();
const upload = require ("./uploadConfig.js");
const bcrypt = require("bcrypt");


//-------mysql
const mysql = require("mysql");
const config = require("./dbConfig");
const con = mysql.createConnection(dbconfig);




app.use(express.static(path.join(__dirname,"public")));   
app.use(express.json());
app.use(express.urlencoded({extended: true}));



app.get("/", (req,res) => {
    res.sendFile(path.join(__dirname, "Page1.html"));
});


//--- Customer service -----
app.get("/login", (req, res) => {
    res.sendFile(path.join(__dirname, "/Page1.html"));
});

app.get("/register", (req, res) => {
    res.sendFile(path.join(__dirname, "/register.html"));
});

app.get("/upload", (req, res) => {
    res.sendFile(path.join(__dirname, "/เกี่ยวกับทีมงาน.html"));
});

app.get("/login", (req, res) => {
    res.sendFile(path.join(__dirname, "/โปรไฟล์ผู้ใช้.html"));
});

app.get("/myupload", (req, res) => {
    res.sendFile(path.join(__dirname, "/ข้อมูลรายบุคคล.html"));
});

app.get("/register", (req, res) => {
    res.sendFile(path.join(__dirname, "/แจ้งข้อมูล.html"));
});

app.get("/upload", (req, res) => {
    res.sendFile(path.join(__dirname, "/แจ้งข้อมูลคนที่มีอยู่แล้ว.html"));
});

app.get("/upload", (req, res) => {
    res.sendFile(path.join(__dirname, "/โต้แย้ง.html"));
});


// --- Owner service ----
app.get("/uploadedfile", (req, res) => {
    res.sendFile(path.join(__dirname, "/admin.html"));
});

app.get("/receipt", (req, res) => {
    res.sendFile(path.join(__dirname, "/หน้ารับแจ้ง.html"));
});

app.get("/receipt", (req, res) => {
    res.sendFile(path.join(__dirname, "/หน้ารับโต้แย้ง.html"));
});

//***************other routes */


// ------------login case************
app.post("/api/login", (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    const sql = `SELECT user_id, username, password FROM Member WHERE username=?`;
    database.query(sql, [username], function (err, result) {
        if (err) {
            res.status(500).send("DB Server Error");
        } else {
            if (result[0].password == password) {
                if (result[0].role == "customer") {
                    res.send("/upload");
                } else {
                    res.send("/uploadedfile");
                }

            } else {
                res.status(401).send("Wrong username or password");
            }

        }
    });
});

// ------------register case************
app.post("/api/register", function(req, res){
    upload(req, res, function(err){
        if(err){
            console.log(err);
            res.status(500).send("Upload error");
        }
        else{
            //upload done, save to Data Base
            const Fname = req.body.Fname;
            const Lname = req.body.Lname;
            const gender = req.file.gender;
            const date = req.body.date;
            const month = req.body.month;
            const year = req.file.year;
            const email = req.body.email;
            const address = req.file.address;
            const username = req.body.username;
            const password = req.body.password;
            

            //hash password
            bcrypt.hash(password, 10, function(err, hash){
                if(err){
                    console.log(err);
                    res.status(500).send("Hash error");
                }else{
                    //get hash password
                    //insert to DB
                    const sql = "INSERT INTO Member(Fname,Lname,gender,date,month,year,email,address,username, password)VALUES(?,?,?,?,?,?,?,?,?,?)";
                    con.query(sql,[Fname,Lname,gender,date,month,year,email,address,username, password,"customer" ], function(err, result){
                        if(err){
                            console.log(err);
                            res.status(500).send("Error!!!");
                        }
                        else{
                            res.send("Register done!");
                        }
                    });
                }
            });

        }
    });
});

//------------upload case***********

app.get("/api/getUpload", (req, res) => {

    const sql = `SELECT file_id, file_name,  FROM picture`;

    database.query(sql, function (err, result) {
        if (err) {
            res.status(500).send("DB Server Error");
        } else {
            res.json(result);
        }
    });
});

app.post("/api/setFile", (req, res) => {
    const P_id = req.body.file_id;    
    const M_id = req.body.user_id;

    const sql = `INSERT INTO files (P_name, M_id) VALUES (?,?)`;

    database.query(sql, [P_id, M_id], function (err, result) {
        if (err) {
            res.status(500).send("DB Server Error");
        } else {
            if (result.affectedRows != 1) {
                res.status(500).send("DB Server Error");
            } else {
                res.send("/receipt");
            }
        }
    });
});


const PORT =  process.env.PORT || 1800;
app.listen(PORT,(req,res)=>{
    console.log("Server is running at " + PORT);
});