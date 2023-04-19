
import express from 'express';

//create express app

const app = express();

app.get('/', (req, res) => {
    res.send('Hello World!');
})

app.listen(5000, () => {
    console.log('Server started on port 5000');
});
