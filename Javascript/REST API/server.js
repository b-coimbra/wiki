var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var request = require('request');

//Configure app to use bodyParser();
app.use(bodyParser.urlencoded({ extend: true}));
app.use(bodyParser.json());

var port = process.env.PORT || 1337;

//Routes for the API
var router = express.Router();
router.use(function(req, res, next) {
	console.log("Got Request"); // -> Something is happening
	next();
})

router.get('/', function(req, res) {
	res.json({message: "It worked! You are getting a JSON response from your own API server!"});
});


//Custom URL e.g. example.com:1337/api/ECHO

router.route('/:echo').get(function(req, res) {

	res.json({echo: req.params.echo});
})



//All routes will be prefixed with /api
app.use('/api', router);


//Start the server
app.listen(port);
console.log('API server has been started on port ' + port);