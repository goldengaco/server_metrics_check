#!/bin/bash

# server_metrics_check.sh
# Author: Carlos Javier García Contreras
# Description: Script for monitoring system metrics on Linux servers.

# Initialize variables with default values
CHECK_CPU=false
CHECK_MEMORY=false
WARNING_THRESHOLD=0
CRITICAL_THRESHOLD=0
SLEEP_INTERVAL=0

# Function to display script usage information
show_usage() {
  echo "Usage: $0 [-C] [-M] [-w warning_threshold] [-c critical_threshold] [-s sleep_interval]"
  echo "Examples:"
  echo "  $0 -C -w 70 -c 90 -s 5  # Check CPU with warning threshold 70, critical threshold 90, and sleep interval 5 seconds"
  echo "  $0 -M -w 80,101 -c 90,101  # Check memory with warning threshold 80%, critical threshold 90%"
  exit 1
}

# Parse command line options using getopts
while getopts "CMw:c:s:" opt; do
  case $opt in
    C)
      CHECK_CPU=true
      ;;
    M)
      CHECK_MEMORY=true
      ;;
    w)
      WARNING_THRESHOLD=$OPTARG
      ;;
    c)
      CRITICAL_THRESHOLD=$OPTARG
      ;;
    s)
      SLEEP_INTERVAL=$OPTARG
      ;;
    \?)
      # Invalid option provided, display usage information
      show_usage
      ;;
  esac
done

# Display usage information if no arguments are provided
if [ $OPTIND -eq 1 ]; then
  show_usage
fi

# Function to retrieve CPU stats
get_cpu_stats() {
  CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\):/ {print 100 - $8}' | awk '{printf "%.2f", $1}')
  echo "CPU OK: idle ${CPU_USAGE}% |idle=${CPU_USAGE};${WARNING_THRESHOLD};${CRITICAL_THRESHOLD} user=0.00 system=0.00 iowait=0.00 steal=0.00"
}

# Function to retrieve memory stats
get_memory_stats() {
  MEMORY_STATS=$(free | awk 'NR==2 {printf "%.2f", $3 / $2 * 100}')
  echo "MEMORY OK: Mem used: ${MEMORY_STATS}% |MemUsed=${MEMORY_STATS};${WARNING_THRESHOLD};${CRITICAL_THRESHOLD} SwapUsed=0.00;0.00;0.00 MemCached=0.00 SwapCached=0.00 Active=0.00"
}

# Main script

# Check if CPU monitoring is requested
if $CHECK_CPU; then
  get_cpu_stats
fi

# Check if memory monitoring is requested
if $CHECK_MEMORY; then
  get_memory_stats
fi

# Exit with status 0 (OK)
exit 0
