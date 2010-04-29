# Much borrowed from http://github.com/igrigorik/PubSubHubbub

require 'rubygems'
require 'httparty'

module PushClient
  
  class Communicator
    include ::HTTParty
    
    HEADERS = {'User-Agent' => 'PuSH Ruby Client', 'Content-Type' => 'application/x-www-form-urlencoded'}
    
    def initialize(hub)
      @hub = hub
    end
  end
  
  class Subscriber < Communicator
    
    def initialize(hub)
      super(hub)
      yield self if block_given?
    end
    
    def subscribe(feed, callback, options = {})
      command('subscribe', feed, callback, options)
    end
    
    def unsubscribe(feed, callback, options = {})
      command('unsubscribe', feed, callback, options)
    end
    
    private
    def command(mode, feed, callback, options)
      options['hub.verify'] ||= 'sync'
      params = {'hub.mode' => mode, 'hub.topic' => feed, 'hub.callback' => callback}.merge(options)
      
      self.class.post("#{@hub}", :body => params, :headers => HEADERS)
    end
    
  end
  
  class Publisher < Communicator
    
    def initialize(hub)
      super(hub)
      yield self if block_given?
    end
    
    def publish(*feeds)
      
      feeds.flatten.each do |f|
        self.class.post("#{@hub}", :body => {'hub.mode' => 'publish', 'hub.url' => f}, :headers => HEADERS)
      end
      
    end
    
  end
  
  
end