#!/usr/bin/ruby

########################################################################
#      DEVELOPERS:
#      [+] NAME:         Heitor Gouvea
#      [+] EMAIL:        hi@heitorgouvea.com
#      [+] BLOG:         http://blog.heitorgouvea.com
#      [+] GITHUB:       https://github.com/HeitorG
#      [+] SITE:         https://heitorg.github.io
#      [+] FACEBOOK:     https://fb.com/heitor.gouvea.9
#
#      [+] NAME:         Murilo Souza
#      [+] EMAIL:        murilosouza.pkk@hotmail.com
#      [+] GITHUB:       https://github.com/MurilloSouza
#      [+] FACEBOOK:     https://fb.com/profile.php?id=100010546054161
#      [+] Twitter:      @k3nshi_
########################################################################

require "httparty";

type  = ARGV[0];

def help
  print "\n\tCOMMAND \t FUNCTION
  \t--online         Decrypt online.
  \t--offline        Decrypt offline.
  \t-m --md5         Setting Hash type md5.
  \t-s --sha1        Setting Hash type sha1\n
  \tExamples:\n
  \truby sheep.rb --online -m 23ec24c5ca59000543cee1dfded0cbea
  \truby sheep.rb --online -s 6525f2e663e8d223c2f9041fefdf2dba6ca70d63
  \truby sheep.rb --offline --md5 23ec24c5ca59000543cee1dfded0cbea
  \truby sheep.rb --offline --sha1 6525f2e663e8d223c2f9041fefdf2dba6ca70d63\n\n";
  exit;
end

if type.nil?
  help();
end

def online
  hash  = ARGV[1];
  value = ARGV[2];

  if hash.nil? || value.nil?
    help();
  end

  case hash
    when "-m", "--md5"
      api = "http://md5.gromweb.com/query/";
    when "-s", "--sha1"
      api = "http://sha1.gromweb.com/query/";
    else
      help();
  end

  sheep = HTTParty.get("#{api}#{value}");
  puts "RESULT ~> #{sheep} \n";
  exit;
end


def offline
  hash  = ARGV[1];
  value = ARGV[2];

  if hash.nil? || value.nil?
    help();
  end

  puts "Under development...";
  exit;
end


case type
  when "--online"
    online();
  when "--offline"
    offline();
  else
    help();
end
