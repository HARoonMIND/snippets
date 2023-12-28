mgt-dev-new
docker rm -f mycontainer
mgtcommerce/mgt-dev:v3

docker run -d --net=bridge -v /var/lib/mysql -v /home/cloudpanel --restart=always --privileged -h mgt-dev --name mgt-dev -it -p 80:80 -p 443:443 -p 8443:8443 -p 22:22 -p 3306:3306 -p 9200:9200 -p 15672:15672 mgtcommerce/mgt-dev:v3


sudo docker container start exciting_wilson


docker container start -d --net=bridge -v /var/lib/mysql -v /home/cloudpanel --restart=always --privileged -h mgt-dev --name mgt-dev -it -p 80:80 -p 443:443 -p 8443:8443 -p 22:22 -p 3306:3306 -p 9200:9200 -p 15672:15672 mgtcommerce/mgt-dev:v3


docker stats



sudo docker container start mgt-dev3
