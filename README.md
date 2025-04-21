# cs5296Project

## Introduction
This project aims to build a jenkins master-agnet environment to do the benchmark on the performance of jenkins on different server on the cloud provider. The test platforms include Azure, AWS and local virtual machine.

We build a environment include java, jenkins, prometheus, grafana and other tools we used to do the benchmark.

## setup
Our experiment is running on Ubuntu 24.04

1. run the jenkinset.sh set the environment of jenkins on the master node

2. run the prometheus.sh to install the prometheus and grafana on the master node

3. run the agentset.sh to install all the software on agent node.

4. run sshmaster.sh and sshagent.sh to set the ssh login on both master and agent nodes

5. set the log source of prometheus and the agent source of jenkins

6. run the test pipeline

## Usage

run the pipeline on agent and record the performance of jenkins