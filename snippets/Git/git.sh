#--------------------------------GIT:----------------------------------------


git add -A stages all changes
git add . stages new files and modifications, without deletions
git add -u stages modifications and deletions, without new files

git commit -m "Update Amasty and Swissup Plugin "
git push origin magento_2_3_4

git pull origin magento_2_3_4
git clone -b magento_2_3_4 https://github.com/VisionetSystemsInc/tbg.git


git merge dev --allow-unrelated-histories

#🔍search: how to remove git from a folder
#@description: if folder all sit with git and you want to set as new repository 

git rm -r --cached myFolder

# OR

git init
