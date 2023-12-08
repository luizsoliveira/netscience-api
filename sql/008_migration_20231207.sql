ALTER TABLE IF EXISTS secure.tasks
    RENAME TO tasks_tmp;

ALTER TABLE secure.tasks_tmp
    DROP COLUMN "project_id";

ALTER TABLE secure.tasks_tmp
    ADD COLUMN "pipeline" varchar;

UPDATE secure.tasks_tmp SET pipeline = 'dataset';

ALTER TABLE secure.tasks_tmp
    ALTER COLUMN "pipeline" SET NOT NULL;

CREATE TABLE "secure"."tasks" (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "title" varchar NOT NULL,
  "description" text,
  "task_type_id" integer,
  "parameters" json,
  "output" json,
  "return_code" integer,
  "created_at" TIMESTAMP DEFAULT NOW(),
  "started_at" timestamp,
  "finished_at" timestamp,
  "pipeline" varchar NOT NULL
);

CREATE TABLE secure.datasets (
    "pipeline" varchar NOT NULL DEFAULT 'dataset',
    CHECK ( pipeline = 'dataset' )
) INHERITS (secure.tasks);

ALTER TABLE IF EXISTS secure.datasets
    ADD CONSTRAINT datasets_pkey PRIMARY KEY (id);

CREATE TABLE secure.experiments (
    "pipeline" varchar NOT NULL DEFAULT 'experiment',
    "dataset_id" UUID NOT NULL,
    CHECK ( pipeline = 'experiment' )
) INHERITS (secure.tasks);

ALTER TABLE "secure"."experiments" ADD FOREIGN KEY ("dataset_id") REFERENCES "secure"."datasets" ("id");

-- MOVING RECORDS from tasks_tmp to datasets
WITH moved_rows AS (
    DELETE FROM secure.tasks_tmp
    RETURNING *
)
INSERT INTO secure.datasets
SELECT * FROM moved_rows;