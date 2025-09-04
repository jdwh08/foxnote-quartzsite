---
aliases:
tags:
  - readings
  - cs/db
edited: 2025-08-21T20:58
created: 2024-01-07T14:36
reading creator:
reading date:
---
### Source:
Talk by InterviewingIO's UltraKoala.

[lakshman-ladis2009.pdf](https://www.cs.cornell.edu/projects/ladis2009/papers/lakshman-ladis2009.pdf)

---
### Summary:
An early [[NoSQL]] database developed by Facebook.
- Hybrid between Dynamo and BigTable

- NoSQL is needed because we were hitting issues with SQL implementations scaling to massive datasets at tech companies.
	- High write throughput
	- Acceptable read efficiency
	- No specialized hardware
- Willing to sacrifice user experience
	- No more SQL language, simpler interface
	- Simpler data model.
		- Key/Value but also grouped into sets
		- They do now have a limited SQL thing on top
		- Now added secondary indexes, views, etc.
- Interface:
	- insert(table, key, rowMutation)
	- get(table, key, columnName)
	- delete(table, key, columnName)


A NODE: a running process of Cassandra (usually on one piece of hardware). They communicate with each other to build up the database.

Data Model:
1. Partitioned: each node in the cluster has a subset of the data, not the full data. (Sharding when we do DB across multiple clusters)
	1. Partitioning uses **Consistent Hashing** 
		1. This is also a helpful technique for system design!
		2. Goal: cluster is dynamic in composition (add/remove/replace nodes).
		3. Consistent hashing reduces impact of data movement with new nodes.
		4. Also used in Dynamo. Dynamo does multiple positions for each node.
		5. Cassandra attempted to look at load (% of total data per node) and do it simply.
			1. This was done in a way that makes it hard when we only change a few nodes instead of a LOT of nodes, unlike Dynamo.
			2. Big companies like Apple like to use the original design since they can scale up and down by a LOT of nodes. The original approach reduces "data explosion?"
		6. Hashing is no longer ordered; can't sort on hash anymore since ordering created "hotspotting". Now uses "murmur3" which is randomly placing partitions to have a nice partition.
			1. The original hope was that if we have very heterogenous hardware (e.g., high CPU and low CPU) the DB would still work. Ordering is good for this. However, in practice no one does this so it was killed.

2. Replication: multiple nodes have the same row. Typical factor is 3 (odd for clear majority). Good for fault tolerance and performance.
	1. Replication also uses Consistent Hashing!
	2. Suppose the data is a [[Ring Buffer]] like thing. We can walk across through the line
		1. Numbers from 1-32. If 6 pops out, then the node for 4-7 owns this key. Keep walking around the circle (8-11), (12-15) which would also store copies.
	3. Can also tell replication based on cloud "availability zones" or physical data center "racks". 
		1. If one "zone" or "rack" goes down, we don't want all copies to go away!
		2. Rings are rack-aware, so next value is on a different rack.
	4. Cassandra used to use "Zookeeper clusters" for managing nodes (common and strongly consistent for metadata) to "Gossip" (weakly consistent) to reduce dependency on zookeeper. This caused some bugs. New updates for Cassandra create their own metadata for which cluster(s) have metadata information stored (back to strong consistency). Downside is that occasionally makes it hard to add nodes.
	5. Coordinator Node: now any nodes can be coordinator nodes. What node(s) are in charge of handling the actual reading and writing? This is better due to hotspotting.
		1. If there is one key which is super hot loaded a lot, and we route it all to one coordinator, it might be possible for nearby keys to have issues with availability. 
		2. Downside is this adds another hop and thus latency.
		3. Lease based coordinator? No. Once upon a time it's was first node in the range. Today all the coordinator does is determine which node(s) are to be requested. Nodes handle multiple requests via coordination (many requests) AND a little bit of data read/write operations (fewer).
		4. This is different from a 'druid' where nodes have specific roles
	6. There is no leader node. Leader nodes were the ones which made decisions about **metadata** (which clusters own and process what data?) so it was strongly consistent. Nowadays it's a group of nodes. 
		1. Zookeeper: Leader continues until it fails, and then a new "leader election"
	7. Consistency, Consistency Quorem vs Local Quorem?
		1. Not quite strongly consistent in the context of RAFT? RAFT does extra stuff for guarantee?
		2. Local Quorem gets "read your writes consistency" -- if you write with local you can read with local, but not all nodes will.
		3. Strong Consistency: when you write everyone can see it
		4. Local Quorem can't answer if 2/3 nodes are down.
		5. Alternative: we can allow "any node response" to get even higher availability BUT it's even worse consistency

3. Cluster Membership: Which node(s) are in the cluster?
	1. Cluster membership determined by Gossip, specifically scuttlebutt algorithm. Gossip is super fault tolerant and you can have almost all nodes down and have it still work.
		1. Uh scuttlebutt today is viewed as not great because it takes a very long time for nodes to approach back into the 
		2. "It's called gossip because you can't rely on it, it's only rumours." This is NOT a reliable way to determine membership.
		3. Gossip today is used for non-critical information, e.g., machine metadata (hardware, etc. as opposed to IP),
	2. Propagation time (first seeded -> all nodes know) became way too long particularly if clusters are very large. This created huge issues for updates, e.g., 5min duration where some nodes thought data existing except still doesn't causing failures
	3. The "Fan-Out problem" Gossip has nodes talk to two FIXED nodes + one random seed. The node depth gets very long, $\log_2(n)$. Other DBs dynamically use more talk nodes AND Spanning Tree??
		1. Largest cluster sizes are like 1024 or 2048 nodes. Several TB per node results in low petabyte-scale storage.
		2. Above 2k nodes, we start using multiple clusters.

4. Local Persistence
	1. Commit Log -> Mem Table (in memory) -> Flush to SortedString Tables once full like in BigTable -> compaction (merge multiple SStables to get more space and performance). 
		1. Sorted String allows you to do binary search like thing on keys.
	2. Writes are written to commit log and then to memory. 
		1. High write throughput requires writing to sequential before writing to an in-memory data structure.
			1. Query in-memory data structure -> data in memory -> result
		2. SSDs weren't a thing back then. Spinning disk! Sequential means we don't need to have it seek around.
		3. Commit log helps deal with crash fails. It writes commit log back into memory so we don't lose data.
		4. Commit log is fast because we just shove bytes into a file. SS table needs to do sorting (key 1 before 2 before 3, etc.)
5. Quasi-SEDA event staged driven architecture
	1. There are network transport, read, write stages. 
	2. Cassandra did NOT handle queues just saying they are unbounded. This leads to problems.
	3. It makes debugging very hard. Requests jump across threads going through each stage. You lose call stacks. Thus people need to build special tracing.
		1. Thread-per-core architecture is now good like commercial variants of Cassandra.
	4. Used to use UDP. Pretty much no-one ever uses UDP. TCP is good enough since hardware is good. Network switches don't handle UDP well especially in cloud.

Node Movement???
- Moves both primary and replicas???

Practical Examples:
1. Facebook Inbox Search was done via Cassandra for 100MM users.

L5 (senior) needs Level System Design?
- No, don't pick specific databases unless they are forced to.
	- Bringing up a specific DB (Cassandra) opens you up to the more specific questions.
	- The guy was interviewed by a Kafka expert when he tossed out KafkaDB.
- Talk about the requirement(s) of the system they need are.
	- I need high availability
	- I am okay with eventual consistency
	- I need scale not in relational DB
- Principals are required: consistent hashing, replication, partitioning

How do devs get better at nodes with tiny setups?
- Easy-Cass-Lab: use AWS accounts and Homebrew. Can setup nodes with stress baked in.
- Cassandra-Easy-Stress: generate fake traffic for a cluster with stress node.

Large companies often shut down parts of Cassandra
- secondary views, materialized views, consistency settings, etc.

When NOT to use Cassandra?
- Consistency requirements.
- Feature richness from SQL queries.

When to use Cassandra?
- "Web scale" throughput. Millions of requests per second.
- Get/insert/delete is all you need.
- ScyllaDB is a close alternative (C++)

Facebook later moved to RoxDB, local nodes etc.


Recommendations?
- Database Internals book. Very dense. Skim to know what's out there. Dive into specific sections.

---
### Notes:
I currently know very little about system design or storage or databases. 