# push-client

## Using Subscriber
    PushClient::Subscriber.new('http://someexamplehub.com').subscribe('somefeedurl', 'somecallbackurl')
    or
    PushClient::Subscriber.new('http://someexamplehub.com') do |s|
    	s.subscribe('somefeedurl1', 'somecallbackurl1')
    	s.subscribe('somefeedurl2', 'somecallbackurl2')
    	s.subscribe('somefeedurl3', 'somecallbackurl3')
    end

## Using Publisher
    PushClient::Publisher.new('http://someexamplehub.com').publish('somefeedurl', 'somefeedurl', 'somefeedurl')
    or
    PushClient::Publisher.new('http://someexamplehub.com') do |s|
    	s.publish('somefeedurl1')
    	s.publish('somefeedurl2')
    	s.publish('somefeedurl3')
    end

## Dependencies
* HTTParty

## Tests
There are no tests as I don't know how to write them for a client like this :/

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Peter Haza. See LICENSE for details.
