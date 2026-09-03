WITH RECURSIVE category_tree AS (
    SELECT
        id,
        name,
        parent_id,
        name::TEXT AS path,
        0 AS level
    FROM categories
    WHERE parent_id IS NULL

    UNION ALL

    SELECT
        c.id,
        c.name,
        c.parent_id,
        ct.path || ' -> ' || c.name,
        ct.level + 1
    FROM categories c
    JOIN category_tree ct
      ON c.parent_id = ct.id
)
SELECT *
FROM category_tree
ORDER BY path;
