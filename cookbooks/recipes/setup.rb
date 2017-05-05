script "setup" do
  interpreter "bash"
  user "ubuntu"
  group "ubuntu"
  Chef::Log.level = :debug
# pulling before putting crontab so that any changes can be taken care of
 mode = node[:mode]
 service = node[:service]
  code1 = ''
  code1 +=  "
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' filebeat|grep \"install ok installed\")
  echo Checking for somelib: $PKG_OK
  if [ "" == \"$PKG_OK\" ]; then
  echo \"No somelib. Setting up somelib.\"
  cd /tmp ;
  curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.3.0-amd64.deb ;
  sudo dpkg -i filebeat-5.3.0-amd64.deb ;
  sudo service filebeat start ;
  fi
  "
   puts code1
   system(code1)
end
