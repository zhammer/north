CREATE TABLE "public"."haikus"(
    "id" serial NOT NULL,
    "line1" text NOT NULL,
    "line2" text NOT NULL,
    "line3" text NOT NULL,
    "post_id" integer NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("post_id") REFERENCES "public"."posts"("id")
);

CREATE TRIGGER "set_public_haikus_updated_at"
    BEFORE UPDATE ON "public"."haikus"
    FOR EACH ROW
    EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();

COMMENT ON TRIGGER "set_public_haikus_updated_at" ON "public"."haikus" IS 'trigger to set value of column "updated_at" to current timestamp on row update';

CREATE TABLE "public"."haiku_versions"(
    "haiku_id" integer NOT NULL,
    "line1" text NOT NULL,
    "line2" text NOT NULL,
    "line3" text NOT NULL,
    "version_number" integer NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY ("haiku_id", "version_number"),
    FOREIGN KEY ("haiku_id") REFERENCES "public"."haikus"("id")
);

CREATE OR REPLACE FUNCTION "public"."save_haiku_version" ()
    RETURNS TRIGGER AS $$
DECLARE
BEGIN
    INSERT INTO haiku_versions (haiku_id, line1, line2, line3, version_number)
    VALUES (
        NEW.id,
        NEW.line1,
        NEW.line2,
        NEW.line3,
        (SELECT COALESCE (MAX(version_number) + 1, 0) from haiku_versions WHERE haiku_id = NEW.id)
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "save_haiku_version_after_insert_trigger"
    AFTER INSERT ON "public"."haikus"
    FOR EACH ROW
    EXECUTE PROCEDURE "public"."save_haiku_version" ();

CREATE TRIGGER "save_haiku_version_after_update_trigger"
    AFTER UPDATE ON "public"."haikus"
    FOR EACH ROW
    WHEN (
        OLD.line1 != NEW.line1
        OR OLD.line2 != NEW.line2
        OR OLD.line3 != NEW.line3
    )
    EXECUTE PROCEDURE "public"."save_haiku_version" ();

