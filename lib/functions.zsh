function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function take() {
  mkdir -p $1
  cd $1
}

function sh_ed2k() { 
	wget -q -O - "$1" | grep "ed2k://" |  sed -e 's/^.*=//g;s/..$//g'
}

function getcpu() {
    CpuValue=`ps -C $1 -o pcpu |grep -v CPU | awk '{print $1}'`
    echo $CpuValue
}

function listen() {
    TCPListeningnum=`netstat -an | grep ":$1 " | \
    awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l`
    UDPListeningnum=`netstat -an|grep ":$1 " \
    |awk '$1 == "udp" && $NF == "0.0.0.0:*" {print $0}' | wc -l`
    (( Listeningnum = TCPListeningnum + UDPListeningnum ))
    if [ $Listeningnum == 0 ] 
    then
    {
        echo "0"
    } else {
        echo "1"
    }
    fi
}
