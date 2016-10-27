for h in `cat hosts.txt`
do

   
	 
	HNAME=`ssh -oStrictHostKeyChecking=no ibmadmin@$h "hostname"`
	CORES=`ssh -oStrictHostKeyChecking=no ibmadmin@$h "nproc"`
	PFAM=`ssh -oStrictHostKeyChecking=no ibmadmin@$h "cat /proc/cpuinfo | grep -i name | head -1 | cut -d: -f2"` # Processor family
	MEMORY=`ssh -oStrictHostKeyChecking=no ibmadmin@$h "free -g" | grep -i mem | awk '{print $2}'` #RAM MEM IN GB 
#	ROOTSP=`ssh -oStrictHostKeyChecking=no ibmadmin@$h "sudo df -h | egrep \/$ " | awk '{print $1}'`	
	ROOTDISK=`ssh -oStrictHostKeyChecking=no ibmadmin@$h "sudo /sbin/fdisk -l | egrep -i '/dev/sda|/dev/xvda' | head -n1"`
echo "########################################################################################"
echo "########################### Host : $HNAME  ######################################"
echo "																						  "
echo "																						  "
echo "##==>  Total CPU Cores : $CORES "
echo "##==>  CPU Family : $PFAM"
echo "##==>  Total RAM Memory in GB : $MEMORY"
#echo "##==>  Root FS / disk total $ROOTSP																	"
echo "##==>  Root DISK(first disk) /dev/*da :  $ROOTDISK "
echo "																						"
echo "																						"

echo "########################################################################################"
echo "########################################################################################"
echo "########################################################################################"

echo "																						"
echo "																						"
echo "																						"																			



done
