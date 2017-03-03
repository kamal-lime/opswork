script "apache" do
  interpreter "bash"
  user "ubuntu"
  group "ubuntu"


  code1 = "";
  code1 +=  "sudo mount /dev/xvdf /mnt/solr;
  USED=$(df /dev/xvdf | awk '{print $5}'| sed -ne 2p | cut -d'%' -f1)
  if [ $USED -gt 2 ]
  then
  sudo rm -rf /mnt/solr1/
fi

  sudo service apache2 restart;"
   puts code1
   code code1



end
