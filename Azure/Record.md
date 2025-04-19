# Azure



## Jenkins Azure Node Configuration Table 





| Node Type | Hostname / IP | CPU     | Memory | Instance Type   | Components                                 |
| --------- | ------------- | ------- | ------ | --------------- | ------------------------------------------ |
| Master    | 20.248.208.79 | 2 cores | 4 GiB  | Standard B2s    | openjdk-17, docker, jenkins, node_exporter |
| Agent 1   | 20.92.200.57  | 2 cores | 4 GiB  | Standard B2s    | openjdk-17, docker, node_exporter          |
| Agent 2   | 4.198.168.54  | 2 cores | 8 GiB  | Standard D2s_v3 | openjdk-17, docker, node_exporter          |



![image-20250419213644966](img\image20250419213644966.png)

![image-20250419214718715](img\image20250419214718715.png)





## Real World App





![image-20250419220155943](img\image20250419220155943.png)

![image-20250419220405466](img\image20250419220405466.png)





### Agent1



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745071258543&to=1745071349401&timezone=browser&var-project=$__all&var-job=node&var-node=20.92.200.57:9100&var-hostname=AgentS&var-device=eth0&var-maxmount=%2F&var-show_hostname=AgentS



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745071258543&to=1745071349401&timezone=browser&var-project=$__all&var-job=node&var-node=20.248.208.79:9100&var-hostname=MasterCp&var-device=eth0&var-maxmount=%2F&var-show_hostname=MasterCp







```
22:00:58  🕒 BUILD_START_MS = 1745071258543
22:02:29  🕒 BUILD_END_MS = 1745071349401
```





#### Agent1

![image-20250419220756268](img\image20250419220756268.png)

#### Master





![image-20250420004401121](img\image20250420004401121.png)





### Agent2



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745071258543Z&to=1745071349401&timezone=browser&var-project=$__all&var-job=node&var-node=4.198.168.54:9100&var-hostname=AgentL&var-device=eth0&var-maxmount=%2F&var-show_hostname=AgentL



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745071258543&to=1745071349401&timezone=browser&var-project=$__all&var-job=node&var-node=20.248.208.79:9100&var-hostname=MasterCp&var-device=eth0&var-maxmount=%2F&var-show_hostname=MasterCp







```
22:00:58  🕒 BUILD_START_MS = 1745071258543
22:02:29  🕒 BUILD_END_MS = 1745071349401
```



#### Agent2



![image-20250419221448516](img\image20250419221448516.png)



#### Master

![image-20250419221932410](img\image20250419221932410.png)





### Jenkins Agent Node Performance Comparison

| **Metric**          | **Agent 1 (20.92.200.57)** | **Agent 2 (4.198.168.54)** |
| ------------------- | -------------------------- | -------------------------- |
| **CPU Cores**       | 2 cores                    | 2 cores                    |
| **Memory Size**     | 4 GiB                      | 8 GiB                      |
| **Memory Usage**    | ~61.2%                     | ~47.6%                     |
| **CPU Utilization** | ~95% peak, 65% average     | ~67% peak, 47% average     |
| **Load Average**    | 0.60 – 0.80                | 0.72 – 1.0                 |

#### Disk & Network I/O Comparison

| **Metric**                  | **Agent 1**          | **Agent 2**          |
| --------------------------- | -------------------- | -------------------- |
| **Disk Usage**              | 2.64 GiB / 28.98 GiB | 2.62 GiB / 28.98 GiB |
| **Disk I/O (peak)**         | ~640 KiB/s           | ~1.0 MiB/s           |
| **Network Inbound (peak)**  | ~770 KiB/s           | ~772 KiB/s           |
| **Network Outbound (peak)** | ~340 KiB/s           | ~700 KiB/s           |

#### Socket & Connection Metrics

| **Metric**                | **Agent 1** | **Agent 2** |
| ------------------------- | ----------- | ----------- |
| **TCP Connections**       | ~66         | ~76         |
| **Open File Descriptors** | ~1.2K       | ~1.4K       |
| **iowait (CPU%)**         | 0.17%       | 0.06%       |
| **System Errors**         | None        | None        |

## Pet Clinic



![image-20250419221824777](img\image20250419221824777.png)



### Agent1



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745072753283&to=1745072845410&timezone=browser&var-project=$__all&var-job=node&var-node=20.92.200.57:9100&var-hostname=AgentS&var-device=eth0&var-maxmount=%2F&var-show_hostname=AgentS



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745072753283&to=1745072845410&timezone=browser&var-project=$__all&var-job=node&var-node=20.248.208.79:9100&var-hostname=MasterCp&var-device=eth0&var-maxmount=%2F&var-show_hostname=MasterCp







```
22:25:53  🕒 BUILD_START_MS = 1745072753283
22:27:25  🕒 BUILD_END_MS = 1745072845410
```





#### Agent1

![image-20250419223625490](img\image20250419223625490.png)

#### Master

![image-20250419223717033](img\image20250419223717033.png)









### Agent2



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745072754131&to=1745072855634&timezone=browser&var-project=$__all&var-job=node&var-node=4.198.168.54:9100&var-hostname=AgentL&var-device=eth0&var-maxmount=%2F&var-show_hostname=AgentL



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745072754131&to=1745072855634&timezone=browser&var-project=$__all&var-job=node&var-node=20.248.208.79:9100&var-hostname=MasterCp&var-device=eth0&var-maxmount=%2F&var-show_hostname=MasterCp







```
22:25:54  🕒 BUILD_START_MS = 1745072754131
22:27:35  🕒 BUILD_END_MS = 1745072855634
```



#### Agent2



![image-20250419224924065](img\image20250419224924065.png)



#### Master



![image-20250419225000676](img\image20250419225000676.png)





### **Jenkins Agent Node Performance Comparison**



| Metric              | Agent 1     | Agent 2     |
| ------------------- | ----------- | ----------- |
| **CPU Cores**       | 2 cores     | 2 cores     |
| **Memory Size**     | 4 GiB       | 8 GiB       |
| **Memory Usage**    | ~71%        | ~47%        |
| **CPU Utilization** | ~91% (peak) | ~71% (peak) |
| **Load Average**    | ~1.5 – 2.0  | ~0.9 – 1.1  |

#### Disk & Network I/O Comparison

| Metric                      | Agent 1                               | Agent 2                               |
| --------------------------- | ------------------------------------- | ------------------------------------- |
| **Disk Usage** (`/`)        | 2.98 GiB / 29.8 GiB                   | 2.80 GiB / 29.8 GiB                   |
| **Disk I/O Rate (peak)**    | ~2.6 KiB/s (read)  ~8.2 KiB/s (write) | ~2.0 KiB/s (read)  ~4.6 KiB/s (write) |
| **Network Inbound (peak)**  | ~800 KiB/s                            | ~1.6 MiB/s                            |
| **Network Outbound (peak)** | ~800 KiB/s                            | ~1.5 MiB/s                            |

#### Socket & Connection Metrics

| Metric                    | Agent 1 | Agent 2 |
| ------------------------- | ------- | ------- |
| **TCP Connections**       | ~80     | ~190    |
| **Open File Descriptors** | ~40     | ~120    |
| **Iowait (CPU%)**         | ~1.0%   | ~0.17%  |
| **System Errors**         | None    | None    |

## Open Meetings



![image-20250419232559356](img\image20250419232559356.png)

### Agent1



![image-20250420000956075](img\image20250420000956075.png)



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745075686710&to=1745076980226&timezone=browser&var-project=$__all&var-job=node&var-node=20.92.200.57:9100&var-hostname=AgentS&var-device=eth0&var-maxmount=%2F&var-show_hostname=AgentS



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745075686710&to=1745076980226&timezone=browser&var-project=$__all&var-job=node&var-node=20.248.208.79:9100&var-hostname=MasterCp&var-device=eth0&var-maxmount=%2F&var-show_hostname=MasterCp







```
23:14:46  🕒 BUILD_START_MS = 1745075686710
23:36:20  🕒 BUILD_END_MS = 1745076980226
```





#### Agent1

![image-20250420001126852](img\image20250420001126852.png)

#### Master



![image-20250420001258932](img\image20250420001258932.png)







### Agent2



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745075686715&to=1745076887065&timezone=browser&var-project=$__all&var-job=node&var-node=4.198.168.54:9100&var-hostname=AgentL&var-device=eth0&var-maxmount=%2F&var-show_hostname=AgentL



http://20.248.208.79:3000/d/9CWBzd1f0bik001/linuxe4b8bb-e69cba-e8afa6-e68385?orgId=1&from=1745075686715&to=1745076887065&timezone=browser&var-project=$__all&var-job=node&var-node=20.248.208.79:9100&var-hostname=MasterCp&var-device=eth0&var-maxmount=%2F&var-show_hostname=MasterCp







```
23:14:46  🕒 BUILD_START_MS = 1745075686715
23:34:47  🕒 BUILD_END_MS = 1745076887065
```



#### Agent2





![image-20250420004312932](img\image20250420004312932.png)

#### Master





![image-20250420004133357](img\image20250420004133357.png)





### **Jenkins Agent Node Performance Comparison**

| Metric              | Agent 1          | Agent 2             |
| ------------------- | ---------------- | ------------------- |
| **CPU Cores**       | 2 cores          | 2 cores             |
| **Memory Size**     | 4 GiB            | 8 GiB               |
| **Memory Usage**    | ~32.1%           | ~11.1%              |
| **CPU Utilization** | ~2.1% (peak ~4%) | ~0.18% (peak ~0.2%) |
| **Load Average**    | ~1.6 – 2.0       | ~1.6 – 2.0          |

---

#### **Disk & Network I/O Comparison**

| Metric                      | Agent 1             | Agent 2             |
| --------------------------- | ------------------- | ------------------- |
| **Disk Usage (`/`)**        | 2.69 GiB / 28.9 GiB | 2.80 GiB / 30.9 GiB |
| **Disk I/O Rate (peak)**    | ~44 KiB/s           | ~300 KiB/s          |
| **Network Inbound (peak)**  | ~2.8 MiB/s          | ~4 MiB/s            |
| **Network Outbound (peak)** | ~6 MiB/s            | ~5 MiB/s            |

---

#### **Socket & Connection Metrics**

| Metric                    | Agent 1 | Agent 2 |
| ------------------------- | ------- | ------- |
| **TCP Connections**       | —       | —       |
| **Open File Descriptors** | —       | —       |
| **Iowait (CPU%)**         | ~0.04%  | ~0.18%  |
| **System Errors**         | None    | None    |







