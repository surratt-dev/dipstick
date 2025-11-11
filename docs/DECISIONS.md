# Decision Log - Engineering Health Check Tool

## 2025-11-10: Initial Requirements Gathering

### Decision 1: Document Purpose
**Question:** What is the primary purpose of the BRD?  
**Answer:** Clean up the Engineering Health Check document and create requirements for a software tool to facilitate the process.

### Decision 2: Document Cleanup Scope
**Question:** What aspects need cleaning up?  
**Answer:** Remove all organization-specific references (company names, team names, individual names 

### Decision 3: Tool Scope - In Scope
**Question:** What features are must-haves for the tool?  
**Answer:** 
- Team management
- Waiting room where teammates join before session starts
- Facilitation workflow
- Action item and note capture
- Voting capture (finger votes 1-4, Roman votes)
- End of session summary
- Historical data tracking and trending
- Abstract model for prompts (customizable per team)
- Default set of prompts from the document

### Decision 4: Tool Scope - Out of Scope
**Answer:**
- Scheduling functionality
- Action item tracking (beyond capture during session)

### Decision 5: Platform and Access Model
**Question:** Deployment model, real-time requirements, and access patterns?  
**Answer:**
- **Platform:** Web application, responsive for mobile devices
- **Real-time:** Votes accumulate in real-time, displayed as graduated progress bars
- **Access:** Each participant uses their own device
- **Facilitator view:** Sees all details including individual votes and voter identity
- **Participant view:** Sees only per-prompt aggregates (anonymous voting)
