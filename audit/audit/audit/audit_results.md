# Audit Results

## Query

```sql
SELECT tbl, op,
       old_row->>'name' AS was,
       new_row->>'name' AS now,
       at
FROM audit_log
ORDER BY at DESC;
```

## Sample Output

| tbl      | op     | was    | now     | at                  |
| -------- | ------ | ------ | ------- | ------------------- |
| students | DELETE | Ama    | NULL    | 2026-09-03 10:45:12 |
| students | UPDATE | Kofi   | Kofi M. | 2026-09-03 10:44:55 |

## Changes Captured

- Student name updated from Kofi to Kofi M.
- Student record deleted for Ama.

## Difference Analysis

- UPDATE captured both old and new values.
- DELETE captured only old values.
- Audit trail records who made changes and when.
