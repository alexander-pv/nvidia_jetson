
# A wrapper for tegrastats statistic saving as tabular data:
# See: https://docs.nvidia.com/jetson/archives/l4t-archived/l4t-3231/index.html#page/Tegra Linux Driver Package Development Guide/AppendixTegraStats.html

# Positional arguments
MILLSEC_INT=$1  # The interval between log prints in milliseconds
LOG_DIR=$2      # Logging directory

echo -e "[Tegrastats] Logging  interval: $MILLSEC_INT"
echo -e "[Tegrastats] Logging directory: $LOG_DIR"

tegrastats --interval $MILLSEC_INT | while read a; 
do 
        # Check if logfile exists
	if ! [ -f "$2/sysload_stats.csv" ]; then
	   echo "RAM,SWAP,CPU1,CPU2,CPU3,CPU4,CPU5,CPU6,CPU7,CPU8,AO_T,GPU_T,Tdiode_T,AUX_T,CPU_T,thermal,Tboad_T,UTC" > "$2/sysload_stats.csv";
	fi

        # Write a row to logfile
	echo "$a, $(date +%s)" | awk -F "[/ ]" '{OFS=","}{print $2,$7,$12,$17,$18,$19,$21,$22,$23,$24,$43}' | sed 's/[][]//g' |
		sed 's/AO@//g' | sed 's/GPU@//g' | sed 's/Tdiode@//g' | sed 's/AUX@//g' | sed 's/CPU@//g' | sed 's/thermal@//g' | sed 's/Tboard@//g' |
		sed 's/C//g' >> "$2/sysload_stats.csv";
        
done &
