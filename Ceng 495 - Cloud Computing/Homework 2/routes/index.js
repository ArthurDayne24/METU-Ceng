var express = require('express');
var router = express.Router();
var mongoClient = require('mongodb').MongoClient;

var url = "mongodb+srv://mytemizer:joseph123joseph@mytebay-ign4w.azure.mongodb.net/test?retryWrites=true";

var userInfo = {};
var globProducts = [];
/* GET home page. */
router.get('/', function(req, res, next) {



  res.sendFile(__dirname+ '/index.html');
});

router.get('/addUserPage', function(req, res, next) {

  res.sendFile(__dirname + '/addUser.html')
});


router.get('/deleteUserPage', function(req, res, next) {

  res.sendFile(__dirname + '/deleteUser.html')
});


/* GET users listing. */
router.get('/loginPage', function(req, res, next) {

  res.sendFile(__dirname+ '/login.html');
});

router.get('/store/profile', function(req, res, next) {

  res.render('profile', {userInfo:userInfo});
});


router.post('/deposit',async function (req, res, next) {

  var value = req.body.value;

  userInfo.wallet = userInfo.wallet + (value);

  await mongoClient.connect(url, async function (err, client) {
    if (err) throw err;


    var db = client.db('eBay');
    await db.collection('users').updateOne({user_name: userInfo.user_name}, {$set:userInfo}).then(function (res) {
      // assert.equal(null,err);
      console.log('User Wallet Updated!');
      console.log('--------------------------------------------->   ' + userInfo  );
      res.render('store',{prod: JSON.stringify(globProducts),userInfo:userInfo})


    });

  });
});

router.post('/withdraw',async function (req, res, next) {
  var value = req.body.value;

  userInfo.wallet = userInfo.wallet - (value);

  await mongoClient.connect(url, async function (err, client) {
    if (err) throw err;


    var db = client.db('eBay');
    await db.collection('users').updateOne({user_name: userInfo.user_name}, {$set:userInfo}).then(function (res) {
      // assert.equal(null,err);
      console.log('User Wallet Updated!')
      res.render('store',{prod: JSON.stringify(globProducts),userInfo:userInfo})

    });

  });
});


router.post('/buyItem', function (req, res, next) {
  var buyCount = parseInt(req.body.buyCount, 10);
  var price = parseInt(req.body.price, 10);
  var quantity = parseInt(req.body.quantity, 10);
  var product_name = req.body.product_name;
  var seller_name = req.body.seller_name;
  var seller_rating = req.body.seller_rating;
  if (buyCount > quantity || userInfo.wallet < buyCount * price)
    res.redirect('/store');
  else{
    userInfo.wallet = userInfo.wallet - (buyCount * price);


    mongoClient.connect(url, async function (err, client) {

      if (err) throw err;
      var db = client.db('eBay');
      await db.collection('users').updateOne({user_name: userInfo.user_name}, {$set:userInfo}).then(function (res) {
        // assert.equal(null,err);
        console.log('User Wallet Updated!')
      });

      var item = {product_name: product_name,
      photo:res.photo,
      price:price,
      quantity:buyCount,
      seller_name: seller_name,
      seller_rating: seller_rating
      };

      await db.collection('users').updateOne(
          {userName:userInfo.user_name},
          { $push: {orderHistory: item} }
      ).then(function (res) {
        if (err) throw err;
        console.log('User History Updated!')
      });


      await db.collection('users').findOne({user_name: seller_name}).then(function (res) {
        if (err) throw err;
        if (res){
          db.collection('users').updateOne({user_name: res.user_name}, {$inc:{wallet:buyCount*price}}).then(function (result) {
            // assert.equal(null,err);
            console.log('User Wallet Updated!')
          });
          var tempI;
          for(var i=0; i < res.store.length; i++){
            if (res.store[i].product_name === product_name){
              res.store[i].quantity = res.store[i].quantity - buyCount
              tempI = i;
            }
          }
          db.collection('users').updateOne({user_name: seller_name},{$set:res}).then(function () {
            if (err) throw err;
            console.log('Provider Store Updated!')
          })


        }
      }).then(function (res) {
        if (err) throw err;
        console.log('Provider Info Updated!')
      });

      client.close();


    });


    res.redirect('/store');
    console.log('BUY');

  }
  // console.log(req.body);
});


router.post('/loginAsUser', function (req, res, next) {
  var myText = req.body.input; //mytext is the name of your input box


  var res2 = res;
  mongoClient.connect(url, async function (err, client) {

    if (err) throw err;
    var db = client.db('eBay');

    await db.collection('users').findOne({user_name: myText}).then(async function (res) {

      if (res){
        console.log(res);
        userInfo = {
          user_name : res.user_name,
          wallet : res.wallet,
          rating : res.rating,
          store : res.store,
          history : res.history
        };
        res2.redirect('/store');
        // res2.render('layout', {user_name : res.user_name,wallet : res.wallet,rating : res.rating,store : res.store,history : res.history})
        // res2.sendFile(__dirname+ '/store.html', userInfo)

      } else {



        console.log('User Doesnt Exist!');
        res2.redirect('/loginPage');
      }
    });


    client.close();

  });

  // res.sendFile(__dirname+ '/store.html', data)
  // res.render('layout', {userName: myText})
});

router.get('/store', function (req,res,next) {

  var tempProducts = []

  mongoClient.connect(url, function (err, client) {

    if (err) throw err;
    var db = client.db('eBay');
    var res2 = res;
    db.collection('users').find({}).toArray(function(err, response) {

          if (err) throw err;
          for(let i in response){
                if (response[i].user_name !== userInfo.user_name){
                      for (let j in response[i].store){
                        tempProducts.push(response[i].store[j]);
                        // console.log(products)
                      }
                }
          }console.log(userInfo);
          globProducts = tempProducts
          res.render('store', {
            prod: JSON.stringify(globProducts),
            userInfo: userInfo
          });

    });
    client.close();

  });

});

router.post('/insertUser', function(req, res, next) {
  var myText = req.body.input; //mytext is the name of your input box
  console.log(myText);

  var item = {
    user_name: myText,
    wallet: 100,
    rating: 0,
    store: [],
    history: []
  };

  mongoClient.connect(url, async function (err, client) {

    if (err) throw err;
    var db = client.db('eBay');
    await db.collection('users').findOne({user_name: myText}).then(async function (res) {
      if (!res){
        await db.collection('users').insertOne(item, function (err, res) {
          if (err) throw err;
          console.log('User inserted!');
        });
      } else {
        console.log('User Already Exist!');
      }
    });


    client.close();

  });
  res.redirect('/loginPage');

});


router.post('/deleteUser', function(req, res, next) {

  var myText = req.body.input; //mytext is the name of your input box
  console.log(myText);

  mongoClient.connect(url, async function (err, client) {

    if (err) throw err;
    var db = client.db('eBay');

    await db.collection('users').findOne({user_name: myText}).then(async function (res) {
      if (res){
        await db.collection('users').deleteOne({user_name: myText}, function (err, res) {
          if (err) throw err;
          console.log('User Deleted!');
        });
      } else {
        console.log('There is no user as ' + myText + '!');
      }
    });


    client.close();

  });


  res.redirect('/')
});



module.exports = router;
