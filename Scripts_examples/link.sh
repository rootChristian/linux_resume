readonly name=${1}
touch /home/Scripts/Template/${name}.sh
chmod 751 /home/Scripts/Template/${name}.sh
echo '#!/bin/bash' > /home/Scripts/Template/${name}.sh
readonly date=`date`
echo -e "<<comment!!!\n/************************************************************
******* Author:         Christian KEMGANG NGUESSOP 
******* Version:        1.0.0                         
******* Created date:   ${date}        
******* Modified date:     
*************************************************************/\ncomment!!!" >> /home/Scripts/Template/${name}.sh
echo '#************************** START **************************#' >> /home/Scripts/Template/$name.sh
echo '#*************************** END ***************************#' >> /home/Scripts/Template/$name.sh
ln -sv /home/Scripts/Template/${name}.sh /bin/${name}
