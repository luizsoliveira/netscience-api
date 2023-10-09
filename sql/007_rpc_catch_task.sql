CREATE OR REPLACE FUNCTION secure.catch_task(taskType text)
RETURNS TABLE (
    id uuid,
    --project_id integer,
    title character,
	parameters json,
	created_at timestamp,
	started_at timestamp
    ) AS $$
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
$$ LANGUAGE SQL;