<!-- Step 1: Determine PHP User -->

<!-- Create a PHP file containing the following: -->

<?php echo `whoami`; ?>
<!-- Upload it to your web server. The output should be similar to the following: -->

www-data
<!-- Therefore, the PHP user is www-data. -->

<!-- Step 2: Determine Owner of Directory -->

<!-- Next, check the details of the web directory via the command line: -->

ls -dl /var/www/example.com/public_html/example-folder
<!-- The result should be similar to the following: -->

drwxrwxr-x 2 exampleuser1 exampleuser2 4096 Mar 29 16:34 example-folder
<!-- Therefore, the owner of the directory is exampleuser1. -->

<!-- Step 3: Change Directory Owner to PHP User -->

<!-- Afterwards, change the owner of the web directory to the PHP user: -->

sudo chown -R www-data /var/www/example.com/public_html/example-folder
<!-- Verify that the owner of the web directory has been changed: -->

ls -dl /var/www/example.com/public_html/example-folder
<!-- The result should be similar to the following: -->

drwxrwxr-x 2 www-data exampleuser2 4096 Mar 29 16:34 example-folder
<!-- Therefore, the owner of example-folder has successfully been changed to the PHP user: www-data. -->

<!-- Done! PHP should now be able to write to the directory. -->