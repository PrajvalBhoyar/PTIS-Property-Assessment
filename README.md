# PTIS Property Assessment
SQL Server schema for tracking property assessment lifecycle with:
- One current status per property
- Full immutable status history
- High performance for 1M+ records

## Status Flow
Register Property → Geo-Sequencing → Survey → Data Processing → Quality Audit → Assessment Completed

## Database
- SQL Server 2019+
- Optimized for large-scale PTIS systems

## Deployment Order
1. database/01_schema
2. database/02_indexes
3. database/03_partitioning (optional)
4. database/04_stored_procedures
5. database/05_views

