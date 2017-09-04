# Network-Monitoring-with-SNMP
  SNMP counters are modeled and are made available through enterprise OIDs. A sub-agent script was written that respond to SNMP requests with the current value of the counters. A prober was designed to calculate the rate change of the counters. The rates of the counters are stored in the influxDB database and are displayed graphically using grafana. 
