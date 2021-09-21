const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

app.use(cors());    
app.use(express.json());


app.post("/employees", async(req,res) =>{
    try {
        const {employee_name} = req.body;
        const newEmployee = await pool.query(
            "INSERT INTO employee_info (employee_name) VALUES($1) RETURNING *",[employee_name]
        );

        res.json(newEmployee.rows[0]);
    } catch (error) {
        console.error(error.message)
    }
});

app.get("/employees", async(req, res) => {
    try {
        const allEmployees = await pool.query("SELECT * FROM employee_info");
        res.json(allEmployees.rows);
    } catch (error) {
        console.error(error.message)
    }
})

app.listen(5000, () =>{
    
})