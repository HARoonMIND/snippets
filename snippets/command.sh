?templatehints=magento
#  with sound :
    php bin/magento s:up && \
    php -dmemory_limit=2G  bin/magento s:d:c && \
    php -dmemory_limit=3G bin/magento s:s:d en_US ar_SA -f && \
    echo -e "\07" && htop

bin/magento cron:run --group="report_cron_group"
// ar_SA
for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r | less

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
bin/magento config:set system/security/max_session_size_admin 2560000 && \
bin/magento config:set admin/security/session_lifetime 31536000
### --------------------------Deployment SAP ORDER -------------------------------------------

php -dmemory_limit=2G bin/magento sap:order:date-status 2022-9-26 shipped
### --------------------------Deployment Production Producer-------------------------------------------
php bin/magento deploy:mode:set developer
php  bin/magento deploy:mode:set production -s
php bin/magento queue:consumers:list
php bin/magento catalog:image:resize
php bin/magento c:c
php bin/magento c:f
php bin/magento s:up
php -dmemory_limit=2G bin/magento s:s:d en_US en_GB -f

php bin/magento push:order 2000000873
php bin/magento push:order 2000001047
php -dmemory_limit=2G bin/magento sap:order:date-status 2022-10-1 pending
php -dmemory_limit=2G bin/magento sap:order:date-status 2022-7-1 processing
php -dmemory_limit=2G bin/magento sap:order:date-status 2022-7-1 processing
php -dmemory_limit=2G bin/magento sap:order:sync-csv sample.csv

php -dmemory_limit=12G  bin/magento indexer:reindex
php -dmemory_limit=2G  bin/magento s:d:c
php -dmemory_limit=1G  bin/magento setup:di:compile
php  -dmemory_limit=12G bin/magento setup:di:compile

php bin/magento s:s:d --theme Magento/backend --theme Smartwave/scChild en_US ar_SA -f
php bin/magento s:up --keep-generated
php bin/magento setup:static-content:deploy
php  -dmemory_limit=2G bin/magento setup:static-content:deploy en_US ar_SA -f

debug:

php -dmemory_limit=2G bin/magento setup:static-content:deploy  --theme Smartwave/porto en_US en_GB -f

php bin/magento module:disable Vnecoms_Sms
php bin/magento module:disable Mind_SAP

php htdocs/test1.sportscorner.qa/current/bin/magento c:f
php htdocs/test1.sportscorner.qa/current/bin/magento s:up
php htdocs/test1.sportscorner.qa/current/bin/magento s:s:d en_US ar_SA -f
php htdocs/test.sportscorner.qa/current/bin/magento c:f
php htdocs/test.sportscorner.qa/current/bin/magento s:up
php htdocs/test.sportscorner.qa/current/bin/magento s:s:d en_US ar_SA -f


cd htdocs/test1.sportscorner.qa/current/app/code/
cd htdocs/test.sportscorner.qa/current


php bin/magento c:f
php  -dmemory_limit=2G bin/magento s:s:d en_US ar_SA -f

Cloud Flare set on Development

php bin/magento cron:run



mysql -u therkn-test -p 1DzSNkTmGd37uRkj -d therkn-test

TRUNCATE TABLE catalog_product_entity;
php bin/magento module:disable  Swissup_FieldManager
php bin/magento module:disable  Swissup_AddressFieldManager
php bin/magento module:disable  Aheadworks_StoreCredit

#Uninstall Module Using Command Line [if module in composer]
php bin/magento module:uninstall Namespace_Module
php bin/magento module:enable Mind_Filter
php bin/magento module:disable Searchanise_SearchAutocomplete

### ---------------------------------------------------------------------

 cd /home/scqatar/sc-dev/
# https://magento.stackexchange.com/questions/88242/magento-2-xml-validation
# Check updates to the GitHub today, Magento 2 introduced new command to automatically generate all the URN resolutions for the PhpStorm.
php bin/magento dev:urn-catalog:generate .idea/misc.xml

#new user
php bin/magento admin:user:create --admin-user=haroonmind11 --admin-password=Haroonmind123456! --admin-email=haroonmind123@gmail.com --admin-firstname=Haroon --admin-lastname=khan

php bin/magento admin:user:create --admin-user=haroonmind --admin-password=Haroonmind123456! --admin-email=haroon.khan@tbg.qa --admin-firstname=Haroon --admin-lastname=khan

php bin/magento admin:user:create --admin-user=haroonmind --admin-password=asdasdsad3123! --admin-email=haroonmind@gmail.com --admin-firstname=Haroon --admin-lastname=khan

admin2
haroonmind
Admin123456!
php bin/magento admin:user:create --admin-user=admin3 --admin-password=Admin123456!




session.save_handler = files
session.save_path = "var/www/shopatregal.com/public_html/session"

### --------------------------BASH-------------------------------------------
 grep -r Go to Showroom *
 grep -r woocommerce-notices-wrapper *
 grep -r /var/cpanel/php/sessions/ea-php72/ *

### Navigate Directory
To navigate into the root directory, use "cd /"
To navigate to your home directory, use "cd" or "cd ~"
To navigate up one directory level, use "cd .."
To navigate to the previous directory (or back), use "cd -"

# FOR COPY :
cp [OPTION] Source Destination
cp [OPTION] Source Directory
cp [OPTION] Source-1 Source-2 Source-3 Source-n Directory
cp -a  pub/static/. pub/static_bkp/
cp -a ../public_html/pub/media/catalog/product/. pub/media/catalog/product/
cp -a app/code/* ../dev5/app/code -R
cp -a /home/cloudpanel/htdocs/test1.test/Magento-2-main/* /home/cloudpanel/htdocs/test1.test/ -R

cp -a rasenconnector/* test1 -R
cp -a  /Magento-2-main ./Magento-2-main

. means current folder.
.. means parent folder of the current folder.
* means copy everything from the current folder (wildcard).
-R means copy folders and files in inside them recursively.
cp -a pub/static_4_22_2020/.  pub/static/
cp -a  scChild/. scChild_rtl/

FOR Remove

rm -i will ask before deleting each file. Some people will have rm aliased to do this automatically (type "alias" to check). Consider using rm -I instead, which will only ask once and only if you are trying to delete three or more files.
rm -r will recursively delete a directory and all its contents (normally rm will not delete directories, while rmdir will only delete empty directories).
rm -f will forcibly delete files without asking; this is mostly useful if you have rm aliased to ``rm -i'' but want to delete lots of files without confirming each one.
rm -r generated/* var/cache/* var/log/* 


#Check current memory_limit value using CLI:

php -r "echo ini_get('memory_limit').PHP_EOL;"

php -i | grep memory

#----------------------------FOR DEPLOY----------------------------------------


#BASH NAME
--name mgt-dev-72


#----------------------------CHANGE FILE PERMISSION AND OWNER SHIP---------------------------------------
sudo chown root:root * -R
sudo chown clp:root * -R :super user do
chown admin:root * -R   :change owner
chmod -cR 777 .       :change owner
su - clp
sudo chown root:clp * -Rc
#File Give file Permission to all folder to this user
sudo chown ubuntu:ubuntu * -R

#### Permission

#Execute these commands as a root user. If you have already given 777 permission revert it using first two commands else proceed with the rest.

find . -type f -exec chmod 664 {} \;

find . -type d -exec chmod 775 {} \;

find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +

find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
Set the ownership to Magento user and web user using

sudo chown -R <Magento user>:<web server group> .

mv  -v Magento-2-main/* ./

mv /home/apache2/www/html/ /home/apache2/www/
OR
mv /home/apache2/www/html/ ..

#It's just <magento-root>/var/ folder permission issue.

#Execute below command using CLI modehar

sudo chmod -R 777 var/cache/*
sudo chmod -R 777 pub/*
sudo chmod -R 777 generated/

#----------------------------Give Admin Access to user LINUX---------------------------------------
sudo usermod -aG sudo haroonmind
Create a new user named haroonmind, run: adduser haroonmind
Verify it by running the id marlena command
Log in as marlena: su - marlena. Than run sudo command for verification. For example: sudo ls -l /etc/shadow
#----------------------------Create File in LINUX---------------------------------------
touch index.html
echo '<h1> Hello World </h1>' > index.html
#----------------------------USEFUL COMMANDS FOR MAGNETO---------------------------------------
# read last chnages on file  
tail -f var/log/*.log
#show all log files current changes
tail  -n 15 filename.ext
tail  -n 15 system.log
#--------------------------------ZIP LINUX:----------------------------------------
#----------------------es----------ZIP LINUX:----------------------------------------
find  -iname *swatch-renderer.js*
#Install Zip on Ubuntu and Debian #
sudo apt install zip
#Install Zip on CentOS and Fedora
sudo yum install zip

zip -r rkn_24_10_2021.zip rkndev/ -x '*vendor*' -x '*generated*'
zip -r rkn_19_6_2022.zip www.therkn.com/ 


 zip -r  mdm_coco_23_2_23.zip mdm_coco_/




unzip file.zip -d destination_folder

#If the source and destination directories are the same, you can simply do:

unzip file.zip

#--------------------------------MYSQL----------------------------------------
mysql -u sportscor-test -p
mysql -u haroonmind-p


ALTER USER 'haroonmind'@'localhost' IDENTIFIED WITH mysql_native_password by 'Khan4504002!';
#1. Back up the database using the following command:

mysqldump -u [username] –p[password] [database_name] > [dump_file.sql]
mysqldump -u scqatar_dev4 –pscqatar_dev4 scqatar_dev4 > scqatar_dev4_1_31_2021_mind.sql

# 2. Restore the backup to a local database server - the mysql command will let you take the contents of a .sql file backup, and restore it directly to a database. This is the syntax for the command:

mysql -u [username] –p[password] [database_name] < [dump_file.sql]
#--------------------------------MYSQL END----------------------------------------


https://stackoverflow.com/questions/7217894/moving-changed-files-to-another-branch-for-check-in

grep -rnw '/path/to/somewhere/' -e 'pattern'
-r or -R is recursive,
-n is line number, and
-w stands for match the whole word.
-l (lower-case L) can be added to just give the file name of matching files.
-e is the pattern used during the search
Along with these, --exclude, --include, --exclude-dir flags could be used for efficient searching:

This will only search through those files which have .c or .h extensions:
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
This will exclude searching all the files ending with .o extension:
grep --exclude=\*.o -rnw '/path/to/somewhere/' -e "pattern"
#For directories it's possible to exclude one or more directories using the --exclude-dir parameter. For example, this will exclude the dirs dir1/, dir2/ and all of them matching *.dst/:
grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"

git cherry-pick SHA
git reset HEAD~1
grep -r wk-discount-percent *
wk-discount-percent
grep -r multibiztextiles.com *



#--------------------------------------------------------------------------------------------------
#GET OLD FILE FROM PERVIOUS COMMIT 
git checkout 08618129e66127921fbfcbc205a06153c92622fe path/to/file.txt
git checkout 666f80a4d459c55d86715d36e3c62b2cc935ac97 app/design/frontend/Smartwave/scChild/web/css/custom_main.css


git cherry-pick bd6910c29ebe90dfca857ab93fb2e0584b0e5ff8 


#!/usr/bin/env bash


# --------------------Install Magento Through Command line -------------------------------------
php bin/magento setup:install --base-url=http://project.magento/ \
--db-host=localhost --db-name=magento --db-user=root --db-password=root \
--admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com \
--admin-user=haroonmind --admin-password=Admin123456! --language=en_US \
--currency=USD --timezone=America/Chicago --use-rewrites=1 \
--search-engine=elasticsearch7 --elasticsearch-host=es-host.example.com \
--elasticsearch-port=9200

### Setup Upgrade Using Command Line

php bin/magento setup:upgrade

###If you don’t want to remove pub/static files while installing/updating database then use following command.

php bin/magento setup:upgrade --keep-generated

### Cache Clean Using Command Line

php bin/magento cache:clean

### Cache Flush Using Command Line

php bin/magento cache:flush

### View cache status Using Command Line

php bin/magento cache:status

### Enable Cache Using Command Line

php bin/magento cache:enable [cache_type]

### Disable Cache Using Command Line

php bin/magento cache:disable [cache_type]
###  Amasty_AdminActionsLog

### Static Content Deploy Using Command Line (Use -f for force deploy on 2.2.x or later)

php bin/magento setup:static-content:deploy

###  Static Content Deploy For Particular Language Using Command Line

php bin/magento setup:static-content:deploy en_US

### Static Content Deploy For Magento Backend Theme Using Command Line (Working on 2.1.1 or later)

php bin/magento setup:static-content:deploy --theme="Magento/backend"

###  Static Content Deploy For Specific Themes Using Command Line (Working on 2.1.1 or later)

php bin/magento setup:static-content:deploy --theme Magento/luma --theme Magento/second_theme

###  Exclude Themes on Static Content Deploy and does not minify HTML files Using Command Line (Working on 2.1.1 or later)

php bin/magento setup:static-content:deploy en_US --exclude-theme Magento/luma --no-html-minify


### Reindexing Using Command Line
php bin/magento indexer:reindex catalog_category_product
php bin/magento indexer:status catalog_category_product 
php bin/magento indexer:reindex catalog_product_attribute
php bin/magento indexer:reindex  cataloginventory_stock
php bin/magento indexer:reindex  catalogsearch_fulltext
### View the list of indexers Using Command Line

php bin/magento indexer:info

### View indexer status Using Command Line

php bin/magento indexer:status

### Show the mode of all indexers Using Command Line

php bin/magento indexer:show-mode

### See all modules Status Using Command Line

php bin/magento module:status

### Enable module Using Command Line

php bin/magento module:enable Namespace_Module

### Disable module Using Command Line

php bin/magento module:disable Namespace_Module

### Check Current Mode Using Command Line

php bin/magento deploy:mode:show

### Change To Developer Mode Using Command Line

php bin/magento deploy:mode:set developer

### Change To Production Mode Using Command Line

php bin/magento deploy:mode:set production

### Run the single-tenant Compiler Using Command Line

php bin/magento dev:template-hints:enable 
### Unlock Admin User Using Command Line

php bin/magento admin:user:unlock adminusername

### Enable Maintenance Mode Using Command Line

php bin/magento maintenance:enable

### To enable maintenance mode for all clients except 192.0.0.1 and 192.0.0.2:

php bin/magento maintenance:enable --ip=192.0.0.1 --ip=192.0.0.2

### To clear the list of IPs.

php bin/magento maintenance:enable --ip=none

### Disable Maintenance Mode Using Command Line

php bin/magento maintenance:disable

### Check Maintenance Mode Status Using Command Line

php bin/magento maintenance:status

### Allow IP on Maintenance Mode Using Command Line

php bin/magento maintenance:allow-ips --ip=192.0.0.1 --ip=192.0.0.2

### Set Magento crontab Using Command Line

php bin/magento cron:install --force

### Use --force to rewrite an existing Magento crontab.
### To view the crontab, enter the following command as the Magento file system owner.

crontab -l




# Remove Magento crontab Using Command Line
php bin/magento cron:remove

https://magentip.com/install-magento-2-4-x-on-ubuntu-with-elasticsearch/

bin/magento setup:install \
--base-url=http://mywebsite.com \
--db-host=localhost \
--db-name=m2lite \
--db-user=admin \
--db-password=Admin123456! \
--admin-firstname=Admin \
--admin-lastname=Admin \
--admin-email=haroonmind@gmail.com \
--admin-user=admin \
--admin-password=admin123456! \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1

php -dmemory_limit=3G bin/magento setup:install \--base-url=https://dev2.menasa.qa \--db-host=localhost \--db-name=bssqatar_dev3 \--db-user=bssqatar_dev3 \--db-password=LMQBbvC1kfEB \--admin-firstname=haroon \--admin-lastname=mind \--admin-email=haroonmind@gmail.com  \--admin-user=haroonmind \--admin-password=Admin123456! \--language=en_US \--currency=USD --timezone=America/Chicago \--use-rewrites=1


composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.3.5

composer require mageacademy/mergecustomer

#RKN
cd /home/cloudpanel/htdocs/test.therkn.com


 	0 0 * * * /usr/bin/php /var/www/html/rasenlookup/public/cronsrasen_nagtive.php
  */30 * * * * root  /usr/bin/php /var/www/hydrus.com/html/storeanalytic/dataFetch.php
# link
/catalog/category/view/s/play-tables/id/1468
 
    catalog/category/view/s/cycling/id/1160
   /catalog/category/view/s/cycling/id/1160


rm -rf var/cache/* pub/static/* var/page_cache/* var/page_cache/* var/generation/* pub/static/* var/composer_home/* var/view_preprocesse/*
composer install



php bin/magento setup:store-config:set --base-url="https://rasen.test/"
SQL : MAGENTO 
DELETE FROM url_rewrite WHERE entity_type = 'category' AND entity_id NOT IN (SELECT entity_id FROM catalog_category_entity)
#********************************************File Permission****************************************
sudo chown ubuntu:ubuntu * -R
sudo chmod -R 777 var/cache/* pub/*
sudo chmod -R 777 
sudo chmod 777 -R .
sudo chown www-data: -R .
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
find var pub/static pub/media app/etc generated/ -type f -exec chmod g+w {} \;
find var pub/static pub/media app/etc generated/ -type d -exec chmod g+ws {} \;
chown -R <Magento user>:<web server group> .
chmod u+x bin/magento