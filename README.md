# Coffee Shop RDBMS (PostgreSQL + pgAdmin)

Relational database project using **PostgreSQL** and **pgAdmin**.
Includes: schema (DDL), seed data (DML)/CSV, ERD, and optional full backup.

## Structure
- `sql/schema.sql` – database schema
- `sql/seed.sql` – sample data (or CSVs in `data/`)
- `docs/ERD.png` – ERD diagram
- `backup/coffee_shop.full.backup` – full dump (optional)

## Quick Start
### Option A — SQL files
1. CREATE DATABASE coffee_shop;
2. Run `sql/schema.sql`, then `sql/seed.sql` (أو استيراد CSV من `data/`).

### Option B — Full backup
pg_restore -U postgres -h localhost -p 5432 -d coffee_shop --clean --if-exists --no-owner backup/coffee_shop.full.backup
