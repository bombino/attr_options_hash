$:.unshift File.dirname(__FILE__) + '/lib'
require 'attr_options_hash'
ActiveRecord::Base.send(:include, AttrOptionsHash::ActiveRecordExtension) 