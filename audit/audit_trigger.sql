CREATE TABLE audit_log (
    id BIGSERIAL PRIMARY KEY,
    tbl TEXT NOT NULL,
    op TEXT NOT NULL,
    old_row JSONB,
    new_row JSONB,
    changed_by TEXT DEFAULT CURRENT_USER,
    at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION audit()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit_log(tbl, op, old_row, new_row, changed_by)
        VALUES (TG_TABLE_NAME, TG_OP, NULL, to_jsonb(NEW), CURRENT_USER);
        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit_log(tbl, op, old_row, new_row, changed_by)
        VALUES (
            TG_TABLE_NAME,
            TG_OP,
            to_jsonb(OLD),
            to_jsonb(NEW),
            CURRENT_USER
        );
        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit_log(tbl, op, old_row, new_row, changed_by)
        VALUES (
            TG_TABLE_NAME,
            TG_OP,
            to_jsonb(OLD),
            NULL,
            CURRENT_USER
        );
        RETURN OLD;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audit
AFTER INSERT OR UPDATE OR DELETE
ON students
FOR EACH ROW
EXECUTE FUNCTION audit();
