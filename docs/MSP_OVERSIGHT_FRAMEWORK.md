# SATECH Manufacturing: Strategic MSP/MSSP Oversight & Vendor Governance Playbook

## 1. Governance Overview & Multi-Vendor Ecosystem
This playbook details the operational governance, key performance metrics, and contract enforcement mechanisms used by **SATECH Manufacturing** to oversee global Managed Service Providers (MSPs) and Managed Security Service Providers (MSSPs).

### SATECH Global Partner Responsibility Matrix

| Partner Category | Strategic Vendor Examples | Primary Operational Scope | Escalation Threshold |
| :--- | :--- | :--- | :--- |
| Network & Telecom MSP | Tata Communications, Kyndryl | Underlay WAN/MPLS, SD-WAN Overlay, Global Edge Routers | Packet loss > 0.5% / Site Outage |
| Cloud & Infrastructure MSP | HCLTech, Accenture | Multi-Cloud Core (Azure, AWS, GCP BCDR Infrastructure) | Cloud Gateway Latency > 30ms |
| Managed Security (MSSP) | IBM Security, Orange Cyberdefense | ZTNA/SASE Policies, SOC Monitoring, Incident Response | Unresolved P1 Security Event > 15m |
| Internal SATECH Governance | Global Architecture & Engineering | Architecture Standard, Vendor Scorecard, Budgeting | SLA Breach Penalties / Contract Review |

## 2. Telemetry-Driven Vendor Performance Scorecards

SATECH Manufacturing enforces vendor SLAs through real-time metrics collected directly by the **Grafana & Prometheus Observability Engine** rather than relying on vendor-reported figures.

* **Mean Time to Acknowledge (MTTA):** Target < 5 minutes for Critical (P1) incidents.
* **Mean Time to Resolve (MTTR):** Target < 30 minutes for P1 (Plant Line Stoppage); < 2 hours for P2 (WAN Redundancy Loss).
* **Configuration Drift Compliance:** Target 100% adherence to baseline templates verified via Ansible playbooks.

## 3. Financial Penalty & Service Credit Structure

| Performance Metric | Threshold Breach | Financial Penalty / Service Credit |
| :--- | :--- | :--- |
| P1 Outage (Plant Line Down) | MTTR > 30 mins | 5% monthly fee credit per 15-min delay (Max 30%) |
| SD-WAN / WAN Availability | Monthly Uptime < 99.95% | 10% monthly WAN management credit |
| SASE Gateway Latency | Latency > 45ms for > 15 mins | 5% monthly MSSP service fee credit |
| Unauthorized Config Change | Unapproved Change execution | $5,000 penalty per event + mandatory Root Cause Analysis |

## 4. Governance Cadence
1. **Weekly Operational Standup:** Review open incidents and changes across SATECH 160 locations.
2. **Monthly SLA Review:** Validate Grafana vendor compliance reports and service credits.
3. **Quarterly Strategic Executive Review:** Review executive performance, AIOps roadmap, and renewals.
