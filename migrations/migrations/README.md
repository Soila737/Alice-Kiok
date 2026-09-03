# PostgreSQL Audit & Hierarchy Lab

## Overview

This project demonstrates:

- Audit logging with triggers
- Recursive category hierarchies
- Flyway migrations
- Least-privilege security

## Objectives

- Track data modifications automatically
- Query hierarchical data structures
- Manage schemas with migrations
- Secure database access

## Repository Structure

```text
audit/
hierarchy/
migrations/
security/
docs/
README.md
```

## Migration Workflow

```bash
flyway migrate
flyway info
```

Migrations execute in version order:

1. Core tables
2. Audit system
3. Categories

## Audit Logging Workflow

1. User modifies data
2. Trigger executes
3. Audit function records changes
4. Audit trail stored in audit_log

## Security Summary

Roles:

- app_read
- app_write

Application user:

```sql
CREATE USER api
LOGIN PASSWORD 'strong-secret'
IN ROLE app_write;
```

Principle used:

Least privilege access control.
