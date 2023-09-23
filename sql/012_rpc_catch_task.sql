CREATE OR REPLACE FUNCTION public.catch_task(taskType text)
RETURNS TABLE (
    id integer,
    --project_id integer,
    key uuid,
	title character,
	parameters json,
	created_at timestamp,
	started_at timestamp
    ) AS $$
    UPDATE public.tasks
    SET    started_at = now()
    WHERE  id = (
                SELECT tk.id
                FROM   public.tasks tk
                INNER JOIN public.task_types tt ON (tt.id = tk.task_type_id)
                WHERE  tk.started_at is null
                AND tt.slug = $1
                ORDER BY tk.created_at ASC
                LIMIT  1
                FOR UPDATE SKIP LOCKED
                )
    RETURNING id, key, title, parameters, created_at, started_at;
$$ LANGUAGE SQL;