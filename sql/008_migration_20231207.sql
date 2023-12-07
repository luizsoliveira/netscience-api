ALTER TABLE IF EXISTS secure.tasks
    RENAME TO datasets;

CREATE VIEW secure.tasks
 AS
SELECT id,
	task_type_id,
	parameters,
	title,
	output,
	return_code,
	created_at,
	started_at,
	finished_at
FROM secure.datasets
ORDER BY id;

ALTER TABLE secure.tasks
    OWNER TO app_user;

CREATE OR REPLACE FUNCTION secure.catch_task(
	tasktype text)
    RETURNS TABLE(id uuid, title character, parameters json, created_at timestamp without time zone, started_at timestamp without time zone) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
    UPDATE secure.tasks
    SET    started_at = now()
    WHERE  id = (
                SELECT tk.id
                FROM   secure.tasks tk
                INNER JOIN secure.task_types tt ON (tt.id = tk.task_type_id)
                WHERE  tk.started_at is null
                AND tt.slug = $1
                ORDER BY tk.created_at ASC
                LIMIT  1
                FOR UPDATE SKIP LOCKED
                )
    RETURNING id, title, parameters, created_at, started_at;
$BODY$;

ALTER FUNCTION secure.catch_task(text)
    OWNER TO app_user;