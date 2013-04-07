#
group {
  "puppet":
    ensure => "present";
}

class {
  "lvphp":;
  "apt":
    always_apt_update => true;
}
