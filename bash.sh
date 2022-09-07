#!/bin/bash 
red="\e[31m"
green="\e[32m"
nc="\e[0m"
function start {
cat << "logo"
         __
        / /\
       / /  \            
      / /    \__________  
     / /      \        /\
    /_/        \      / /
 ___\ \      ___\____/_/_
/____\ \    /_Nethnter__/\
\     \ \   \           \ \
 \     \ \   \____       \ \
  \     \ \  /   /\       \ \
   \   / \_\/   / /        \ \
    \ /        / /__________\/
     /        / /     /
    /        / /     /
   /________/ /\    /
   \_termux __\/\ \  /
               \_\/AhmadOo

logo
printf "loading "
printf "."
sleep 1
printf "."
sleep 1
printf "."
sleep 1
clear
}
start
function tools {
echo -e "${green}checking needed tools${nc} "
sleep 1
for tool in curl python python2 git
do
$tool -h &>/dev/null
done
[ $? -eq 0 ] && echo -e "${green}good all tools are installed${nc}" || echo -e "${red}error missing some tools now its installing ${nc} ..." apt -y update ; apt -y upgrade ; apt -y install curl python2 python2-minimal git pip ; pip install requests
}

function main {
echo ""
echo -e "${green}Select number of Tool $nc"
COLUMNS=12
PS3="Enter number of Tool: " export PS3
select free in find find2 scan payload host2ip installTools help
do
case $free in
find)
echo ""
echo -e "${green}find bughost with domain $nc "
python2 find.py ; main ;;
find2)
echo ""
echo -e "${green}find bughost with ip  $nc "
python3 find2.py 2>&1 | tee tmp.txt ; cat tmp.txt | egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}' >host.txt ; rm tmp.txt; main ;;
scan)
echo ""
echo -e "${green}scan worked SNI bughosts  $nc "
python3 scan.py host.txt ; main ;;
payload)
bash payloads.sh ; main ;;
host2ip)
python3 host2ip.py ; main ;;
installTools)
tools ;main ;;
help)
cat help.txt ;main ;;
*)
echo "you don't select any thing by by ;) " ; exit ;;
esac
done
}
main
