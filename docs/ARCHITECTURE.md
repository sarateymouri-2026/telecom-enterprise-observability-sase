# SATECH Manufacturing: Technical Architecture & Data Flow Blueprint

## 1. Global Topology Overview
SATECH Manufacturing operates across **160 sites in 40 countries**, encompassing high-throughput production facilities, regional distribution hubs, and administrative headquarters. To ensure continuous operational resilience and strict vendor SLA accountability, observability is structured into a unified, tiered telemetric pipeline.

```
+-----------------------------------------------------------------------------------+
|                        SATECH EXECUTIVE & OPERATIONAL LAYER                       |
|   - Grafana Enterprise Dashboards (Role-Based Access Control / SSO)               |
|   - PagerDuty & ITSM Automated Alert Router (ServiceNow Bridge)                    |
+-----------------------------------------------------------------------------------+
                                          ^
                                          | (Encrypted TLS PromQL Queries)
+-----------------------------------------------------------------------------------+
|                    CENTRAL OBSERVABILITY HUB (AWS EU-WEST-1)                       |
|   - High-Availability Prometheus TSDB Core Cluster                                |
|   - Alertmanager Node with Vendor Routing Rules (SLA Penalties Engine)            |
+-----------------------------------------------------------------------------------+
       ^                                  ^                                  ^
       | (mTLS Metrics Pull)              | (gRPC / HTTPS Push)              | (OpenTelemetry Scrape)
+---------------+               +-------------------+               +----------------+
| NETWORK MSP   |               | CLOUD MSP         |               | MSSP (SECURITY)|
| Tata/Kyndryl  |               | HCLTech/Accenture |               | IBM/Orange     |
| SD-WAN Edges  |               | Multi-Cloud VPCs  |               | SASE / ZTNA    |
| (160 Sites)   |               | (AWS, Azure, GCP) |               | Gateways       |
+---------------+               +-------------------+               +----------------+
```

## 2. End-to-End Data Flow Architecture
1. **Telemetry Collection**: Node Exporters and OpenTelemetry Collectors run locally across all 160 plant edges and multi-cloud VPCs, exposing host, network, and gateway metrics on secure endpoints.
2. **Ingestion & Aggregation**: The central AWS Prometheus instance pulls telemetry on a 15-second interval over encrypted IPSec/SD-WAN tunnels.
3. **Rule Evaluation**: Real-time alert rules continuously check thresholds (e.g., Plant down for >1 min, SASE latency >45ms, WAN packet loss >0.5%).
4. **Vendor Attribution**: Every metric is enriched with vendor ownership labels (`Tata_Kyndryl_MSP`, `IBM_Orange_MSSP`, `HCLTech`), instantly tying performance dips to specific SLA contractual targets.
5. **Executive Visualization**: Grafana renders unified dashboards for real-time executive visibility and automated monthly SLA credit calculations.
