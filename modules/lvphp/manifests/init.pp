#lv-php hackathon class

class lvphp() {

  apt::key {
    "dotdeb":
      key_source => "http://www.dotdeb.org/dotdeb.gpg";
  }

  apt::source {
    "dotdeb54":
      location => "http://packages.dotdeb.org",
      release => "squeeze-php54",
      repos => "all",
      require => Apt::Key['dotdeb'];
    "dotdeb":
      location => "http://packages.dotdeb.org",
      release => "squeeze",
      repos => "all",
      require => Apt::Key['dotdeb'];
  }

  class {
    "apache":
      require => Apt::Source['dotdeb54'];
    "mysql":;
    "mysql::server":
      config_hash => { 'root_password' => '' };
  }

  apache::vhost {
    'symfony.lvhack':
      docroot => '/lvhack/symfony/web',
      priority => '10',
      vhost_name => '*',
      port => '80';
    'silex.lvhack':
      docroot => '/lvhack/silex/web',
      priority => '20',
      vhost_name => '*',
      port => '80';
  }

  package {
    [
     "libapache2-mod-php5",
     "php5",
     "php5-cgi",
     "php5-cli",
     "php5-common",
     "php5-curl",
     "php5-dbg",
     "php5-dev",
     "php5-enchant",
     "php5-fpm",
     "php5-gd",
     "php5-geoip",
     "php5-gmp",
     "php5-imap",
     "php5-interbase",
     "php5-ldap",
     "php5-mcrypt",
     "php5-memcache",
     "php5-memcached",
     "php5-mysqlnd",
     "php5-odbc",
     "php5-pgsql",
     "php5-pspell",
     "php5-recode",
     "php5-snmp",
     "php5-sqlite",
     "php5-sybase",
     "php5-tidy",
     "php5-xcache",
     "php5-xdebug",
     "php5-xmlrpc",
     "php5-xsl"
    ]: require => Apt::Source['dotdeb54'];
  }

  file {
    "/usr/local/bin/composer":
      ensure => link,
      target => "/usr/local/bin/composer.phar",
      require => File['/usr/local/bin/composer.phar'];
    "/usr/local/bin/composer.phar":
      mode => 0755,
      owner => 'root',
      group => 'root',
      source => "puppet:///modules/lvphp/composer.phar";
    [
      "/lvhack/symfony/web",
      "/lvhack/silex/web"
    ]:
      owner => 'vagrant',
      group => 'vagrant',
      ensure => directory;
  }
}
