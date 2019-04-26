var express = require('express');
var path = require('path');
// var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var routes = require('./routes/index');
var mongoClient = require('mongodb').MongoClient;

var url = "mongodb+srv://mytemizer:joseph123joseph@mytebay-ign4w.azure.mongodb.net/test?retryWrites=true";

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
init();

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});



// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;




function init() {
  var product1 ={product_name:"koltuk",
    photo:"https://cdn.tekzen.com.tr/images/product/zen-home/2664916/zen-home-kumas-l-kose-koltuk-fume-2011-2557885-72141_1000x1000.jpg",
    price:11,
    quantity:14,
    seller_name:"ali",
    seller_rating:1
  };

  var item1 = {
    user_name: "ali",
    wallet: 0,
    rating: 0,
    store: [product1],
    history: []
  };
  var product2 ={product_name:"masa",
    photo:"http://feroniaart.com.tr/Uploads/_MG_1112.JPG",
    price:12,
    quantity:15,
    seller_name:"veli",
    seller_rating:2
  };

  var product3 ={product_name:"kitap",
    photo:"https://mediacat.com/wp-content/uploads/2017/01/temel-reklamcilik-kitaplari-00.jpg",
    price:12,
    quantity:16,
    seller_name:"veli",
    seller_rating:2
  };

  var item2 = {
    user_name: "veli",
    wallet: 0,
    rating: 0,
    store: [product2,product3],
    history: []
  };

  mongoClient.connect(url, async function (err, client) {

    if (err) throw err;
    var db = client.db('eBay');
    await db.collection('users').findOne({user_name: "ali"}).then(async function (res) {
      if (!res){
        await db.collection('users').insertMany([item1,item2], function (err, res) {
          if (err) throw err;
          console.log('User inserted!');
        });
      } else {
        console.log('User Already Exist!');
      }
    });


    client.close();

  });
}
