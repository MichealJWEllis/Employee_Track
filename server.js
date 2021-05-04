const express = require('express')
const inquirer = require('inquirer')
// const apiRoutes = require('./routes/apiRoutes')
const db = require('./config/connection')
const figlet = require('figlet')

const PORT = process.env.PORT || 8082;
const app = express()

// Express middleware
app.use(express.urlencoded({ extended: false }))
app.use(express.json())

// Use apiRoutes
// app.use('/api', apiRoutes)


// Default response for any other request (NOT found) 
app.use((req, res) => {
    res.status(404).end()
})

// ACII art
figlet('% Employee Tracker %', function(err, data) {
    if (err) {
        console.log('Something went wrong...');
        console.dir(err);
        return;
    }
    console.log(data)
});
// Start server after DB connection
db.connect(err => {
    if (err) throw err
    console.log('Database connected')
    app.listen(PORT, () => {
        console.log(`Server running on port ${PORT}`)
    })
})




