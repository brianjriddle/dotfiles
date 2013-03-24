#!/usr/bin/ruby 
require "uri"

#
# Requirements
# 1) ruby
# 2) newsbeuter/config must have
#   
#      bookmark-cmd "PATH_TO_THIS_SCRIPT" # ie ~/.newsbeuter/bin/bookmark-pinboard.rb
#      bookmark-interactive yes

# Recommended that newsbeuter/config has autopilot enabled
#     bookmark-autopilot yes

# set pin_auth as en environment variable. Don't use username/password
auth_token = ENV["pin_auth"]

# These are the 3 parameters sent to every bookmarkning script
# As I want to set tags as well we need to shift ARGV away.
#
url=URI.escape(ARGV[0])
ARGV.shift
title=URI.escape(ARGV[0])
ARGV.shift 
if ARGV[2]
  desc=URI.escape(ARGV[0])
  ARGV.shift
end

# Always tag with via:newsbeuter
#
tags=%w[via:newsbeuter]
print "Tags: "
tags << gets.chomp.split
tag_params = tags.flatten.collect{|w| URI.escape(w)}
pinboard_url="https://api.pinboard.in/v1/posts/add?url=#{url}&description=#{title}&extended=#{desc}&tags=#{tag_params.join(',')}&auth_token=#{auth_token}"
%x{curl "#{pinboard_url}"}
