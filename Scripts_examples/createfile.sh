: '
/************************************************************
******* Author:    Christian KEMGANG NGUESSOP ***************
******* Version:    1.0.0                     ***************
*************************************************************/
'
#!/bin/bash
read -p "Please provide filename you want to create: " file
echo -e "Please purpose: \c"
read -r purpose

touch /home/Scripts/$file.sh

chmod 755 /home/Scripts/$file.sh

echo '#!/bin/bash' > /home/Scripts/$file.sh

readonly date=`date`

echo -e "<<comment!!!\n/************************************************************
******* Author:         Christian KEMGANG NGUESSOP 
******* Version:        1.0.0                    
******* Purpose:        ${purpose}      
******* Created date:   ${date}        
******* Modified date:     
*************************************************************/\ncomment!!!" >> /home/Scripts/$file.sh
echo '#************************** START **************************#' >> /home/Scripts/$file.sh
echo '#*************************** END ***************************#' >> /home/Scripts/$file.sh
