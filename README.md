# CRM SQL Analysis

A self-built mock CRM database (SQLite) with four related tables, used to practice writing real analytical SQL beyond basic tutorials: joins, correlated subqueries, NULL handling, and aggregate filtering.

## Schema

- **Companies** — id, name, industry
- **Contacts** — id, name, email, company_id, title
- **Deals** — id, name, contact_id, stage, value
- **Activities** — id, deal_id, type, date, notes

Full definitions and sample data are in `schema.sql`.

## Queries

All queries are in `queries.sql`. Below is the business question behind each one, plus what I actually learned building it.

### 1. Deals with no logged activity (or none in the last 30 days)

Identifies deals that are being neglected, not just deals that are old. Uses a `LEFT JOIN` from Deals to Activities so deals with zero activity still show up (an `INNER JOIN` would drop them silently).

The first version of this query grouped by the joined `Activities.deal_id`. That broke silently: every deal with zero activity got `deal_id = NULL` from the join, and `GROUP BY` collapsed all of those NULLs into a single row instead of keeping each neglected deal separate. Fixing it meant grouping by `Deals.ID` instead, since that's always unique even when the join comes back empty.

### 2. Largest deal per company

For each company, find its single highest-value deal. Uses a correlated subquery rather than `GROUP BY` with `MAX()`, because a plain `GROUP BY` can return a `MAX()` value paired with the wrong deal's name. SQLite doesn't require non-aggregated columns to relate to the aggregate, so it can silently pick an arbitrary row. The subquery re-checks, per company, which specific deal actually equals that company's max value, so the name and value returned always belong to the same row.

### 3. Deals priced above their own company's average

Same correlated subquery structure as above, using `AVG()` and `>` instead of `MAX()` and `=`. Flags deals that are outperforming their own company's typical deal size.

### 4. Companies with 2+ deals still in progress

Filters out closed deals (`Closed Won` and `Closed Lost`) before grouping, then uses `HAVING COUNT(*) >= 2` to find companies with multiple active deals in the pipeline.

## What I learned

A few things that don't show up until you actually hit them: `NULL` never equals anything, not even in comparisons, so it has to be tested for explicitly with `IS NULL`. `GROUP BY` only guarantees the aggregated column is correct, any other selected column can come from an arbitrary row in that group unless it's tied to the aggregate through a subquery. And deal names in this data are just labels, not reliable indicators of which company a deal actually belongs to, the foreign key relationship is what matters, not what the row is named.

## Dashboard

The main finding — an open $150K deal with zero logged activity — is visualized in Tableau:

![Deal Value by Stage]
<img width="1416" height="1758" alt="Sheet 1" src="https://github.com/user-attachments/assets/35dee7e3-287c-4eab-8931-e106f5a05231" />


Live version: https://public.tableau.com/app/profile/carlos.cortez7133/viz/DealValueByStage/Sheet1?publish=yes
