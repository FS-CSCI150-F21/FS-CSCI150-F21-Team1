<template>
      <h1>Employees</h1>
      <button @click="addE">Add Number</button>
      <button @click="deleteE">Delete All</button>
      <div v-for="emp in employees" :key="emp.employee_id">
          <h2>{{emp.employee_id }}</h2>
      </div>
</template>

<script>
export default {
    data() {
      return {
        employees: [
          
        ]
      }
    },
    mounted() {
      fetch("http://localhost:5000/employees")
        .then(res => res.json())
        .then(data => this.employees = data)
        .catch(err => console.log(err.message));
    },
    methods:{
      deleteE(){
        fetch('http://localhost:5000/employees',{
          method:'DELETE'
      }).then(response=>{
          console.log("here")
      })
      },

      addE(){
      fetch("http://localhost:5000/employees", {
        method: 'POST', // or 'PUT'
        headers: {
        'Content-Type': 'application/json',
        },
      })
      .then(response => response.json())
      .then(data => {
      console.log('Success:', data);
      })
      .catch((error) => {
      console.error('Error:', error);
      });

      }
    }
    
}
</script>