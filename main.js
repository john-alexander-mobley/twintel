    
   // var Twitter = require('twitter-node-client').Twitter;


    //Callback functions
    var error = function (err, response, body) {
        console.log('ERROR [%s]', err);
    };
    var success = function (data) {
        console.log('Data [%s]', data);
    };

    var Twitter = require('twitter-node-client').Twitter;

    //Get this data from your twitter apps dashboard
    var config = {
        "consumerKey": "xr7qULQMLhW9hntCHsxg0FChp",
        "consumerSecret": "wkdeYBuMsCrQ5OKj6wnbsc5LsCqzWSMCJJPPdVnZB9JhHj2IlK",
        "accessToken": "2908560496-O0YY6uF1InRlA1iRv9SaEbi8WzWJvegjJUvbDll",
        "accessTokenSecret": "YM0zBjobFALfUdI5b3xdQN4iiQj50OA4YH0le7YP4A2Wl",
        "callBackUrl": "http://aprilmaycarter.github.io/"
    }

    var twitter = new Twitter(config);

    var tweet = "?";

    twitter.postTweet({status:tweet}, error,success);
